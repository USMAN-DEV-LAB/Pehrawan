import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pehrawan/core/config/remote_config_values.dart';
import 'package:pehrawan/core/network/dio_client.dart';
import 'package:pehrawan/core/storage/app_storage_service.dart';
import 'package:pehrawan/features/cart/data/repositories/mock_cart_repository.dart';
import 'package:pehrawan/features/cart/domain/repositories/cart_repository.dart';
import 'package:pehrawan/features/catalog/data/repositories/mock_catalog_repository.dart';
import 'package:pehrawan/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:pehrawan/features/orders/data/repositories/mock_order_repository.dart';
import 'package:pehrawan/features/orders/domain/repositories/order_repository.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>(
  (_) => const FlutterSecureStorage(),
);

final appStorageProvider = Provider<AppStorageService>(
  (_) => AppStorageService(),
);

final remoteConfigProvider = StateProvider<RemoteConfigValues>(
  (_) => const RemoteConfigValues(),
);

final dioClientProvider = Provider<DioClient>(
  (ref) => DioClient(secureStorage: ref.watch(secureStorageProvider)),
);

/// Developer toggle to activate future departments (Footwear, Bags) at runtime.
final futureDepartmentsEnabledProvider = StateProvider<bool>((ref) => false);

final catalogRepositoryProvider = Provider<CatalogRepository>((ref) {
  final enabled = ref.watch(futureDepartmentsEnabledProvider);
  return MockCatalogRepository(enableFutureDepartments: enabled);
});

final cartRepositoryProvider = Provider<CartRepository>(
  (_) => MockCartRepository(),
);

final orderRepositoryProvider = Provider<OrderRepository>(
  (_) => MockOrderRepository(),
);

/// App locale state (English / Urdu).
final localeProvider = StateProvider<Locale>((_) => const Locale('en'));

/// App theme mode state.
final themeModeProvider = StateProvider<ThemeMode>((_) => ThemeMode.light);

/// Simple auth/guest state for router guard (expanded in Phase 2).
final isAuthenticatedProvider = StateProvider<bool>((_) => false);
final isGuestProvider = StateProvider<bool>((_) => false);
