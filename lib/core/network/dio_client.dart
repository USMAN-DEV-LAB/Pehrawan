import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pehrawan/core/constants/app_constants.dart';
import 'package:pehrawan/core/errors/app_exception.dart';

/// Configured Dio HTTP client with auth token injection, retry, and debug logging.
class DioClient {
  DioClient({required FlutterSecureStorage secureStorage, Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: AppConstants.apiBaseUrl,
              connectTimeout: const Duration(seconds: 15),
              receiveTimeout: const Duration(seconds: 15),
              headers: const {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
              },
            ),
          ) {
    _dio.interceptors.add(_AuthInterceptor(secureStorage, _dio));
    _dio.interceptors.add(_RetryInterceptor(_dio));
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: false,
          logPrint: (obj) => debugPrint(obj.toString()),
        ),
      );
    }
  }

  final Dio _dio;

  Dio get raw => _dio;

  static AppException mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const NetworkException();
      case DioExceptionType.badResponse:
        final status = e.response?.statusCode ?? 500;
        if (status == 401 || status == 403) {
          return const AuthException();
        }
        if (status == 404) {
          return const NotFoundException();
        }
        return const ServerException();
      default:
        return const ServerException();
    }
  }
}

class _AuthInterceptor extends Interceptor {
  _AuthInterceptor(this._storage, this._dio);

  final FlutterSecureStorage _storage;
  final Dio _dio;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.read(key: 'auth_token');
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401 &&
        err.requestOptions.extra['retriedAuth'] != true) {
      final refreshToken = await _storage.read(key: 'refresh_token');
      if (refreshToken != null && refreshToken.isNotEmpty) {
        try {
          final resp = await _dio.post<Map<String, dynamic>>(
            '/auth/refresh',
            data: {'refreshToken': refreshToken},
          );
          final newToken = resp.data?['accessToken'] as String?;
          if (newToken != null && newToken.isNotEmpty) {
            await _storage.write(key: 'auth_token', value: newToken);
            final req = err.requestOptions;
            req.headers['Authorization'] = 'Bearer $newToken';
            req.extra['retriedAuth'] = true;
            final cloned = await _dio.fetch<dynamic>(req);
            handler.resolve(cloned);
            return;
          }
        } catch (_) {
          // Fall through to error handler if refresh fails.
        }
      }
    }
    handler.next(err);
  }
}

class _RetryInterceptor extends Interceptor {
  _RetryInterceptor(this._dio);

  final Dio _dio;
  static const int _maxRetries = 2;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final attempt = (err.requestOptions.extra['retryAttempt'] as int?) ?? 0;
    final isRetryable =
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError;

    if (isRetryable && attempt < _maxRetries) {
      err.requestOptions.extra['retryAttempt'] = attempt + 1;
      await Future<void>.delayed(Duration(milliseconds: 300 * (attempt + 1)));
      try {
        final response = await _dio.fetch<dynamic>(err.requestOptions);
        handler.resolve(response);
        return;
      } on DioException catch (retryErr) {
        handler.next(retryErr);
        return;
      }
    }
    handler.next(err);
  }
}
