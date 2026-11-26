import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/providers/app_providers.dart';
import 'package:pehrawan/core/router/app_router.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/core/utils/money_utils.dart';
import 'package:pehrawan/core/widgets/widgets.dart';
import 'package:pehrawan/features/catalog/domain/entities/catalog_entities.dart';
import 'package:pehrawan/features/catalog/presentation/providers/catalog_providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _scrollController = ScrollController();
  final _bannerController = PageController(viewportFraction: 0.92);
  int _bannerIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _bannerController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final pos = _scrollController.position;
    if (pos.pixels >= pos.maxScrollExtent - 320) {
      final deptId = ref.read(selectedDepartmentIdProvider);
      ref.read(justForYouProvider(deptId).notifier).loadMore();
    }
  }

  void _showDebugSheet(BuildContext context) {
    final l10n = context.l10n;
    BottomSheetScaffold.show<void>(
      context: context,
      title: l10n.developerTools,
      child: Consumer(
        builder: (context, ref, _) {
          final enabled = ref.watch(futureDepartmentsEnabledProvider);
          final isUrdu = ref.watch(localeProvider).languageCode == 'ur';
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.enableFutureDepartments),
                subtitle: Text(
                  enabled ? l10n.futureDeptsOn : l10n.futureDeptsOff,
                ),
                value: enabled,
                onChanged: (val) {
                  ref.read(futureDepartmentsEnabledProvider.notifier).state =
                      val;
                  if (!val) {
                    ref.read(selectedDepartmentIdProvider.notifier).state =
                        'dept_fashion';
                  }
                },
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('${l10n.languageSelectTitle} (${l10n.urdu})'),
                value: isUrdu,
                onChanged: (val) {
                  ref.read(localeProvider.notifier).state = val
                      ? const Locale('ur')
                      : const Locale('en');
                },
              ),
              const SizedBox(height: AppSpacing.sm),
              AppButton(
                label: l10n.designSystemShowcase,
                variant: AppButtonVariant.outlined,
                onPressed: () {
                  Navigator.of(context).pop();
                  context.push(AppRoutes.designSystem);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = Theme.of(context).colorScheme;
    final langCode = context.isUrdu ? 'ur' : 'en';

    final deptsAsync = ref.watch(departmentsProvider);
    final selectedDeptId = ref.watch(selectedDepartmentIdProvider);
    final categoriesAsync = ref.watch(categoriesByDeptProvider(selectedDeptId));
    final bannersAsync = ref.watch(bannersProvider);
    final vouchersAsync = ref.watch(vouchersProvider);
    final flashAsync = ref.watch(flashSaleProductsProvider(selectedDeptId));
    final justForYouAsync = ref.watch(justForYouProvider(selectedDeptId));
    final wishlistIds = ref.watch(wishlistIdsProvider);

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(departmentsProvider);
            ref.invalidate(categoriesByDeptProvider(selectedDeptId));
            ref.invalidate(bannersProvider);
            ref.invalidate(flashSaleProductsProvider(selectedDeptId));
            ref.invalidate(justForYouProvider(selectedDeptId));
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              // White Header
              SliverAppBar(
                floating: true,
                backgroundColor: colors.surface,
                title: const PehrawanLogo(horizontal: true, markSize: 28),
                actions: [
                  if (kDebugMode)
                    IconButton(
                      key: const ValueKey('debug_tools_btn'),
                      tooltip: l10n.developerTools,
                      onPressed: () => _showDebugSheet(context),
                      icon: const Icon(Icons.developer_mode_rounded),
                    ),
                  IconButton(
                    tooltip: l10n.notificationsTitle,
                    onPressed: () => context.push(AppRoutes.notifications),
                    icon: const Icon(Icons.notifications_none_rounded),
                  ),
                  IconButton(
                    tooltip: l10n.wishlistTitle,
                    onPressed: () => context.push(AppRoutes.wishlist),
                    icon: const Icon(Icons.favorite_border_rounded),
                  ),
                ],
              ),

              // Sticky Search Bar
              SliverPersistentHeader(
                pinned: true,
                delegate: _StickySearchDelegate(
                  child: Container(
                    color: colors.surface,
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.screenMargin,
                      AppSpacing.xs,
                      AppSpacing.screenMargin,
                      AppSpacing.xs,
                    ),
                    child: _HomeSearchBar(
                      hint: l10n.searchHint,
                      onTap: () => context.push(AppRoutes.search),
                      onCameraTap: () => ScaffoldMessenger.of(context)
                          .showSnackBar(
                            SnackBar(content: Text(l10n.cameraSearchHint)),
                          ),
                      onMicTap: () => ScaffoldMessenger.of(context)
                          .showSnackBar(
                            SnackBar(content: Text(l10n.voiceSearchHint)),
                          ),
                    ),
                  ),
                ),
              ),

              // Department Tabs from Repository Data
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.xs),
                  child: deptsAsync.when(
                    loading: () => const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.screenMargin,
                      ),
                      child: SkeletonBox(width: 120, height: 36),
                    ),
                    error: (_, _) => const SizedBox.shrink(),
                    data: (depts) {
                      if (depts.isEmpty) return const SizedBox.shrink();
                      final validId = depts.any((d) => d.id == selectedDeptId)
                          ? selectedDeptId
                          : depts.first.id;
                      return DepartmentTabBar(
                        departments: depts,
                        selectedDepartmentId: validId,
                        onSelected: (dept) {
                          ref
                                  .read(selectedDepartmentIdProvider.notifier)
                                  .state =
                              dept.id;
                        },
                      );
                    },
                  ),
                ),
              ),

              // Banner Carousel
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.md),
                  child: bannersAsync.when(
                    loading: () => const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.screenMargin,
                      ),
                      child: SkeletonBox(
                        width: double.infinity,
                        height: 168,
                        borderRadius: AppSpacing.radiusMd,
                      ),
                    ),
                    error: (_, _) => const SizedBox.shrink(),
                    data: (banners) => Column(
                      children: [
                        SizedBox(
                          height: 184,
                          child: PageView.builder(
                            controller: _bannerController,
                            itemCount: banners.length,
                            onPageChanged: (i) =>
                                setState(() => _bannerIndex = i),
                            itemBuilder: (context, index) => _BannerCard(
                              banner: banners[index],
                              langCode: langCode,
                              onTap: () => context.push(
                                '${AppRoutes.listing}?departmentId=$selectedDeptId',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(banners.length, (i) {
                            final active = i == _bannerIndex;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 180),
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              width: active ? 18 : 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: active ? colors.primary : colors.outline,
                                borderRadius: BorderRadius.circular(
                                  AppSpacing.radiusPill,
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Category Circles from Data
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.lg),
                  child: categoriesAsync.when(
                    loading: () => const SizedBox(
                      height: 100,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.screenMargin,
                        ),
                        child: SkeletonBox(width: double.infinity, height: 84),
                      ),
                    ),
                    error: (_, _) => const SizedBox.shrink(),
                    data: (cats) {
                      if (cats.isEmpty) return const SizedBox.shrink();
                      return SizedBox(
                        height: 112,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.screenMargin,
                          ),
                          itemCount: cats.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(width: AppSpacing.sm),
                          itemBuilder: (_, i) {
                            final cat = cats[i];
                            return CategoryCircle(
                              category: cat,
                              onTap: () => context.push(
                                '${AppRoutes.listing}?departmentId=$selectedDeptId&categoryId=${cat.id}&schemaId=${cat.attributeSchemaId ?? ''}&title=${Uri.encodeComponent(cat.localizedName(langCode))}',
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Voucher Strip
              SliverToBoxAdapter(
                child: vouchersAsync.when(
                  loading: () => const SizedBox.shrink(),
                  error: (_, _) => const SizedBox.shrink(),
                  data: (vouchers) {
                    if (vouchers.isEmpty) return const SizedBox.shrink();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: AppSpacing.md),
                        SectionHeader(title: l10n.vouchersTitle),
                        const SizedBox(height: AppSpacing.xs),
                        SizedBox(
                          height: 82,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.screenMargin,
                            ),
                            itemCount: vouchers.length,
                            separatorBuilder: (_, _) =>
                                const SizedBox(width: AppSpacing.sm),
                            itemBuilder: (context, i) => _VoucherCard(
                              voucher: vouchers[i],
                              langCode: langCode,
                              onCopy: () {
                                Clipboard.setData(
                                  ClipboardData(text: vouchers[i].code),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      l10n.codeCopied(vouchers[i].code),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Flash Sale Rail
              SliverToBoxAdapter(
                child: flashAsync.when(
                  loading: () => const Padding(
                    padding: EdgeInsets.only(top: AppSpacing.lg),
                    child: SkeletonProductGrid(itemCount: 2),
                  ),
                  error: (_, _) => const SizedBox.shrink(),
                  data: (flashProducts) {
                    if (flashProducts.isEmpty) return const SizedBox.shrink();
                    return Column(
                      children: [
                        const SizedBox(height: AppSpacing.lg),
                        SectionHeader(
                          title: l10n.flashSale,
                          trailing: FlashSaleTimer(
                            endTime: DateTime.now().add(
                              const Duration(hours: 6, minutes: 45),
                            ),
                          ),
                          onSeeAll: () => context.push(
                            '${AppRoutes.listing}?departmentId=$selectedDeptId&flash=true&title=${Uri.encodeComponent(l10n.flashSale)}',
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        SizedBox(
                          height: 336,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.screenMargin,
                            ),
                            itemCount: flashProducts.length,
                            separatorBuilder: (_, _) =>
                                const SizedBox(width: AppSpacing.sm),
                            itemBuilder: (_, i) {
                              final p = flashProducts[i];
                              return ProductCard(
                                width: 170,
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
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Just For You Header
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: AppSpacing.lg,
                    bottom: AppSpacing.sm,
                  ),
                  child: SectionHeader(title: l10n.justForYou),
                ),
              ),

              // Just For You 2-Column Infinite Grid
              justForYouAsync.when(
                loading: () => const SliverToBoxAdapter(
                  child: SkeletonProductGrid(itemCount: 4),
                ),
                error: (_, _) => SliverToBoxAdapter(
                  child: ErrorState(
                    onRetry: () =>
                        ref.invalidate(justForYouProvider(selectedDeptId)),
                  ),
                ),
                data: (state) {
                  if (state.items.isEmpty) {
                    return SliverToBoxAdapter(
                      child: EmptyState(
                        icon: Icons.checkroom_outlined,
                        title: l10n.noProductsTitle,
                        subtitle: l10n.noProductsSubtitle,
                      ),
                    );
                  }
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenMargin,
                    ),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: AppSpacing.sm,
                            crossAxisSpacing: AppSpacing.sm,
                            childAspectRatio: 0.53,
                          ),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final p = state.items[index];
                        return ProductCard(
                          product: p,
                          isWishlisted: wishlistIds.contains(p.id),
                          onWishlistTap: () => ref
                              .read(wishlistIdsProvider.notifier)
                              .toggle(p.id),
                          onTap: () =>
                              context.push('${AppRoutes.productBase}/${p.id}'),
                        );
                      }, childCount: state.items.length),
                    ),
                  );
                },
              ),

              if (justForYouAsync.valueOrNull?.isLoadingMore == true)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(AppSpacing.md),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),

              const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),
            ],
          ),
        ),
      ),
    );
  }
}

class _StickySearchDelegate extends SliverPersistentHeaderDelegate {
  _StickySearchDelegate({required this.child});

  final Widget child;

  @override
  double get minExtent => 60;

  @override
  double get maxExtent => 60;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => child;

  @override
  bool shouldRebuild(covariant _StickySearchDelegate oldDelegate) => false;
}

class _HomeSearchBar extends StatelessWidget {
  const _HomeSearchBar({
    required this.hint,
    required this.onTap,
    required this.onCameraTap,
    required this.onMicTap,
  });

  final String hint;
  final VoidCallback onTap;
  final VoidCallback onCameraTap;
  final VoidCallback onMicTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final ext = context.ext;

    return Semantics(
      button: true,
      label: hint,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        child: Container(
          height: AppSpacing.minTapTarget,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          decoration: BoxDecoration(
            color: ext.surfaceGrey,
            borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            border: Border.all(color: ext.border),
          ),
          child: Row(
            children: [
              Icon(Icons.search_rounded, color: colors.onSurfaceVariant),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Text(
                  hint,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ),
              IconButton(
                onPressed: onCameraTap,
                icon: const Icon(Icons.camera_alt_outlined, size: 20),
                visualDensity: VisualDensity.compact,
                tooltip: 'Visual search',
              ),
              IconButton(
                onPressed: onMicTap,
                icon: const Icon(Icons.mic_none_rounded, size: 20),
                visualDensity: VisualDensity.compact,
                tooltip: 'Voice search',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BannerCard extends StatelessWidget {
  const _BannerCard({
    required this.banner,
    required this.langCode,
    required this.onTap,
  });

  final BannerItem banner;
  final String langCode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: InkWell(
          onTap: onTap,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Intentional brand-red gradient + tone-on-tone editorial pattern
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [colors.primary, colors.secondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: CustomPaint(
                  painter: _BannerPatternPainter(
                    accentColor: colors.onPrimary.withValues(alpha: 0.08),
                  ),
                ),
              ),
              // Real photo from configurable base URL when available
              CachedNetworkImage(
                imageUrl: banner.imageUrl,
                fit: BoxFit.cover,
                placeholder: (_, _) => const SizedBox.shrink(),
                errorWidget: (_, _, _) => const SizedBox.shrink(),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.52),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              Positioned(
                left: AppSpacing.md,
                right: AppSpacing.md,
                bottom: AppSpacing.md,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      banner.localizedTitle(langCode),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: colors.onPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      banner.localizedSubtitle(langCode),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.onPrimary.withValues(alpha: 0.92),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: colors.onPrimary,
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusPill,
                        ),
                      ),
                      child: Text(
                        l10n.shopNow,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BannerPatternPainter extends CustomPainter {
  _BannerPatternPainter({required this.accentColor});

  final Color accentColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Subtle tone-on-tone editorial arcs
    canvas.drawCircle(
      Offset(size.width * 0.88, size.height * 0.22),
      size.height * 0.45,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.88, size.height * 0.22),
      size.height * 0.72,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.12, size.height * 0.95),
      size.height * 0.36,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _BannerPatternPainter oldDelegate) =>
      oldDelegate.accentColor != accentColor;
}

class _VoucherCard extends StatelessWidget {
  const _VoucherCard({
    required this.voucher,
    required this.langCode,
    required this.onCopy,
  });

  final Voucher voucher;
  final String langCode;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final ext = context.ext;

    return Container(
      width: 240,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: ext.blush,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        border: Border.all(color: colors.primary.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  voucher.localizedTitle(langCode),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: colors.primary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  l10n.minSpend(
                    MoneyUtils.formatPkr(
                      voucher.minOrderAmount,
                      prefix: l10n.currencyPrefix,
                    ),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall,
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: onCopy,
            style: TextButton.styleFrom(
              backgroundColor: colors.primary,
              foregroundColor: colors.onPrimary,
              minimumSize: const Size(56, 36),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            ),
            child: Text(l10n.copyCode),
          ),
        ],
      ),
    );
  }
}
