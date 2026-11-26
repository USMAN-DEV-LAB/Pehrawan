import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pehrawan/core/providers/app_providers.dart';
import 'package:pehrawan/features/catalog/domain/entities/catalog_entities.dart';

@immutable
class SearchState {
  const SearchState({
    this.query = '',
    this.recentSearches = const [],
    this.suggestions = const [],
    this.results = const [],
    this.hasSearched = false,
  });

  final String query;
  final List<String> recentSearches;
  final List<String> suggestions;
  final List<Product> results;
  final bool hasSearched;

  static const List<String> trendingTags = [
    'Lawn',
    'Kurta',
    'Unstitched',
    'Festive',
    'Pret',
    'Bridal',
    'Shalwar Kameez',
  ];

  SearchState copyWith({
    String? query,
    List<String>? recentSearches,
    List<String>? suggestions,
    List<Product>? results,
    bool? hasSearched,
  }) {
    return SearchState(
      query: query ?? this.query,
      recentSearches: recentSearches ?? this.recentSearches,
      suggestions: suggestions ?? this.suggestions,
      results: results ?? this.results,
      hasSearched: hasSearched ?? this.hasSearched,
    );
  }
}

class SearchController extends AsyncNotifier<SearchState> {
  @override
  Future<SearchState> build() async {
    final recent = await ref.read(appStorageProvider).getRecentSearches();
    return SearchState(recentSearches: recent);
  }

  Future<void> onQueryChanged(String query) async {
    final current = state.valueOrNull ?? const SearchState();
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      state = AsyncData(
        current.copyWith(
          query: '',
          suggestions: const [],
          results: const [],
          hasSearched: false,
        ),
      );
      return;
    }

    final matches = await ref
        .read(catalogRepositoryProvider)
        .getProducts(query: trimmed, pageSize: 6);
    final suggestions = matches.map((p) => p.titleEn).toList();
    state = AsyncData(
      current.copyWith(
        query: query,
        suggestions: suggestions,
        hasSearched: false,
      ),
    );
  }

  Future<void> submitSearch(String query) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return;

    final current = state.valueOrNull ?? const SearchState();
    final updatedRecent = [
      trimmed,
      ...current.recentSearches.where((q) => q != trimmed),
    ].take(8).toList();

    await ref.read(appStorageProvider).saveRecentSearches(updatedRecent);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final results = await ref
          .read(catalogRepositoryProvider)
          .getProducts(query: trimmed, pageSize: 30);
      return current.copyWith(
        query: trimmed,
        recentSearches: updatedRecent,
        suggestions: const [],
        results: results,
        hasSearched: true,
      );
    });
  }

  Future<void> clearHistory() async {
    final current = state.valueOrNull ?? const SearchState();
    await ref.read(appStorageProvider).saveRecentSearches(const []);
    state = AsyncData(current.copyWith(recentSearches: const []));
  }
}

final searchControllerProvider =
    AsyncNotifierProvider<SearchController, SearchState>(SearchController.new);
