import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/router/app_router.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/widgets/widgets.dart';
import 'package:pehrawan/features/catalog/presentation/providers/catalog_providers.dart';
import 'package:pehrawan/features/search/presentation/providers/search_providers.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _runSearch(String query) {
    _controller.text = query;
    _controller.selection = TextSelection.collapsed(offset: query.length);
    ref.read(searchControllerProvider.notifier).submitSearch(query);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final searchAsync = ref.watch(searchControllerProvider);
    final wishlistIds = ref.watch(wishlistIdsProvider);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsetsDirectional.only(end: AppSpacing.md),
          child: TextField(
            controller: _controller,
            autofocus: true,
            textInputAction: TextInputAction.search,
            onChanged: (val) =>
                ref.read(searchControllerProvider.notifier).onQueryChanged(val),
            onSubmitted: _runSearch,
            decoration: InputDecoration(
              hintText: l10n.searchHint,
              prefixIcon: const Icon(Icons.search_rounded),
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        _controller.clear();
                        ref
                            .read(searchControllerProvider.notifier)
                            .onQueryChanged('');
                        setState(() {});
                      },
                      icon: const Icon(Icons.close_rounded),
                    )
                  : null,
            ),
          ),
        ),
      ),
      body: searchAsync.when(
        loading: () => const Padding(
          padding: EdgeInsets.only(top: AppSpacing.md),
          child: SkeletonProductGrid(itemCount: 4),
        ),
        error: (_, _) =>
            ErrorState(onRetry: () => ref.invalidate(searchControllerProvider)),
        data: (state) {
          // Live Suggestions
          if (!state.hasSearched && state.suggestions.isNotEmpty) {
            return ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.screenMargin),
              itemCount: state.suggestions.length,
              separatorBuilder: (_, _) => const Divider(),
              itemBuilder: (context, index) {
                final suggestion = state.suggestions[index];
                return ListTile(
                  leading: const Icon(Icons.search_rounded),
                  title: Text(suggestion),
                  onTap: () => _runSearch(suggestion),
                );
              },
            );
          }

          // Search Results
          if (state.hasSearched) {
            if (state.results.isEmpty) {
              return EmptyState(
                icon: Icons.search_off_rounded,
                title: l10n.noProductsTitle,
                subtitle: l10n.noProductsSubtitle,
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.screenMargin,
                    AppSpacing.sm,
                    AppSpacing.screenMargin,
                    AppSpacing.xs,
                  ),
                  child: Text(
                    l10n.resultsCount(state.results.length),
                    style: theme.textTheme.labelLarge,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(AppSpacing.screenMargin),
                    itemCount: state.results.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: AppSpacing.sm,
                          crossAxisSpacing: AppSpacing.sm,
                          childAspectRatio: 0.53,
                        ),
                    itemBuilder: (context, index) {
                      final p = state.results[index];
                      return ProductCard(
                        product: p,
                        isWishlisted: wishlistIds.contains(p.id),
                        onWishlistTap: () =>
                            ref.read(wishlistIdsProvider.notifier).toggle(p.id),
                        onTap: () =>
                            context.push('${AppRoutes.productBase}/${p.id}'),
                      );
                    },
                  ),
                ),
              ],
            );
          }

          // Default: Recent Searches + Trending Tags
          return ListView(
            padding: const EdgeInsets.all(AppSpacing.screenMargin),
            children: [
              if (state.recentSearches.isNotEmpty) ...[
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        l10n.recentSearches,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    TextButton(
                      onPressed: () => ref
                          .read(searchControllerProvider.notifier)
                          .clearHistory(),
                      child: Text(l10n.clearHistory),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xs),
                Wrap(
                  spacing: AppSpacing.xs,
                  runSpacing: AppSpacing.xs,
                  children: [
                    for (final q in state.recentSearches)
                      ActionChip(
                        avatar: const Icon(Icons.history_rounded, size: 16),
                        label: Text(q),
                        onPressed: () => _runSearch(q),
                      ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
              ],
              Text(l10n.trendingTags, style: theme.textTheme.titleMedium),
              const SizedBox(height: AppSpacing.xs),
              Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xs,
                children: [
                  for (final tag in SearchState.trendingTags)
                    ActionChip(
                      avatar: const Icon(Icons.trending_up_rounded, size: 16),
                      label: Text(tag),
                      onPressed: () => _runSearch(tag),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
