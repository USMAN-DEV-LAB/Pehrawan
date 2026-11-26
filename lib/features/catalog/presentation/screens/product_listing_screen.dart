import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/router/app_router.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/core/widgets/widgets.dart';
import 'package:pehrawan/features/catalog/domain/entities/catalog_entities.dart';
import 'package:pehrawan/features/catalog/presentation/providers/catalog_providers.dart';
import 'package:pehrawan/features/catalog/presentation/widgets/schema_filter_sheet.dart';

class ProductListingScreen extends ConsumerStatefulWidget {
  const ProductListingScreen({
    super.key,
    this.departmentId,
    this.categoryId,
    this.isFlashSale,
    this.schemaId,
    this.title,
  });

  final String? departmentId;
  final String? categoryId;
  final bool? isFlashSale;
  final String? schemaId;
  final String? title;

  @override
  ConsumerState<ProductListingScreen> createState() =>
      _ProductListingScreenState();
}

class _ProductListingScreenState extends ConsumerState<ProductListingScreen> {
  final _scrollController = ScrollController();
  bool _isGrid = true;

  ProductListingArgs get _args => ProductListingArgs(
    departmentId: widget.departmentId,
    categoryId: widget.categoryId,
    isFlashSale: widget.isFlashSale,
    schemaId: widget.schemaId,
  );

  String get _effectiveSchemaId {
    if (widget.schemaId != null && widget.schemaId!.isNotEmpty) {
      return widget.schemaId!;
    }
    if (widget.departmentId == 'dept_footwear') {
      return 'schema_footwear';
    }
    return 'schema_clothing';
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final pos = _scrollController.position;
    if (pos.pixels >= pos.maxScrollExtent - 300) {
      ref.read(productListingProvider(_args).notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = Theme.of(context).colorScheme;
    final listingAsync = ref.watch(productListingProvider(_args));
    final wishlistIds = ref.watch(wishlistIdsProvider);
    final currentState = listingAsync.valueOrNull;

    final sortOptions = [
      ('popular', l10n.sortPopular),
      ('price_asc', l10n.sortPriceLow),
      ('price_desc', l10n.sortPriceHigh),
      ('rating', l10n.sortRating),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? l10n.allProducts),
        actions: [
          IconButton(
            tooltip: _isGrid ? 'List view' : 'Grid view',
            onPressed: () => setState(() => _isGrid = !_isGrid),
            icon: Icon(
              _isGrid ? Icons.view_list_rounded : Icons.grid_view_rounded,
            ),
          ),
          IconButton(
            key: const ValueKey('listing_filter_btn'),
            tooltip: l10n.filters,
            onPressed: () {
              SchemaFilterSheet.show(
                context: context,
                schemaId: _effectiveSchemaId,
                initialFilters: currentState?.filters ?? const {},
                onApply: (filters) {
                  ref
                      .read(productListingProvider(_args).notifier)
                      .applySortAndFilters(filters: filters);
                },
              );
            },
            icon: Badge(
              isLabelVisible: (currentState?.filters.isNotEmpty ?? false),
              label: Text('${currentState?.filters.length ?? 0}'),
              child: const Icon(Icons.tune_rounded),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Sort Chips
          SizedBox(
            height: 48,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenMargin,
                vertical: AppSpacing.xxs,
              ),
              itemCount: sortOptions.length,
              separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.xs),
              itemBuilder: (context, index) {
                final (key, label) = sortOptions[index];
                final selected = (currentState?.sortBy ?? 'popular') == key;
                return ChoiceChip(
                  label: Text(label),
                  selected: selected,
                  selectedColor: colors.primaryContainer,
                  onSelected: (_) {
                    ref
                        .read(productListingProvider(_args).notifier)
                        .applySortAndFilters(sortBy: key);
                  },
                );
              },
            ),
          ),
          const Divider(),
          Expanded(
            child: listingAsync.when(
              loading: () => const Padding(
                padding: EdgeInsets.only(top: AppSpacing.md),
                child: SkeletonProductGrid(itemCount: 6),
              ),
              error: (_, _) => ErrorState(
                onRetry: () => ref.invalidate(productListingProvider(_args)),
              ),
              data: (state) {
                if (state.items.isEmpty) {
                  return EmptyState(
                    icon: Icons.search_off_rounded,
                    title: l10n.noProductsTitle,
                    subtitle: l10n.noProductsSubtitle,
                    actionLabel: state.filters.isNotEmpty
                        ? l10n.clearFilters
                        : null,
                    onAction: state.filters.isNotEmpty
                        ? () => ref
                              .read(productListingProvider(_args).notifier)
                              .applySortAndFilters(filters: const {})
                        : null,
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async =>
                      ref.invalidate(productListingProvider(_args)),
                  child: _isGrid
                      ? GridView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.all(
                            AppSpacing.screenMargin,
                          ),
                          itemCount:
                              state.items.length +
                              (state.isLoadingMore ? 1 : 0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: AppSpacing.sm,
                                crossAxisSpacing: AppSpacing.sm,
                                childAspectRatio: 0.53,
                              ),
                          itemBuilder: (context, index) {
                            if (index >= state.items.length) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final p = state.items[index];
                            return ProductCard(
                              product: p,
                              isWishlisted: wishlistIds.contains(p.id),
                              onWishlistTap: () => ref
                                  .read(wishlistIdsProvider.notifier)
                                  .toggle(p.id),
                              onTap: () => context.push(
                                '${AppRoutes.productBase}/${p.id}',
                              ),
                            );
                          },
                        )
                      : ListView.separated(
                          controller: _scrollController,
                          padding: const EdgeInsets.all(
                            AppSpacing.screenMargin,
                          ),
                          itemCount:
                              state.items.length +
                              (state.isLoadingMore ? 1 : 0),
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: AppSpacing.sm),
                          itemBuilder: (context, index) {
                            if (index >= state.items.length) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final p = state.items[index];
                            return _ProductListTile(
                              product: p,
                              isWishlisted: wishlistIds.contains(p.id),
                              onWishlistTap: () => ref
                                  .read(wishlistIdsProvider.notifier)
                                  .toggle(p.id),
                              onTap: () => context.push(
                                '${AppRoutes.productBase}/${p.id}',
                              ),
                            );
                          },
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductListTile extends StatelessWidget {
  const _ProductListTile({
    required this.product,
    required this.isWishlisted,
    required this.onWishlistTap,
    required this.onTap,
  });

  final Product product;
  final bool isWishlisted;
  final VoidCallback onWishlistTap;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final ext = context.ext;
    final langCode = context.isUrdu ? 'ur' : 'en';

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              SizedBox(
                width: 104,
                height: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: product.images.first,
                  fit: BoxFit.cover,
                  placeholder: (_, _) => const SkeletonBox(
                    width: 104,
                    height: 120,
                    borderRadius: 0,
                  ),
                  errorWidget: (_, _, _) => ColoredBox(color: ext.surfaceGrey),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.localizedTitle(langCode),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall,
                      ),
                      const Spacer(),
                      PriceText(
                        price: product.effectivePrice,
                        oldPrice: product.hasDiscount
                            ? product.basePrice
                            : null,
                      ),
                      const SizedBox(height: 2),
                      RatingStars(
                        rating: product.ratingAvg,
                        reviewCount: product.ratingCount,
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: onWishlistTap,
                icon: Icon(
                  isWishlisted
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  color: isWishlisted ? colors.primary : colors.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
