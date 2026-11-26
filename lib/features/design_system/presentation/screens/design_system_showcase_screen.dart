import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/providers/app_providers.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/widgets/widgets.dart';
import 'package:pehrawan/features/catalog/data/datasources/mock_seed_data.dart';

/// Hidden Design System Showcase screen (debug builds only) displaying every
/// reusable component, color token, typography scale, and scalability proof.
class DesignSystemShowcaseScreen extends ConsumerStatefulWidget {
  const DesignSystemShowcaseScreen({super.key});

  @override
  ConsumerState<DesignSystemShowcaseScreen> createState() =>
      _DesignSystemShowcaseScreenState();
}

class _DesignSystemShowcaseScreenState
    extends ConsumerState<DesignSystemShowcaseScreen> {
  String _selectedDeptId = 'dept_fashion';
  Map<String, String> _selectedVariant = {'size': 'M', 'color': 'Crimson'};
  bool _isWishlisted = false;
  bool _showOffline = false;
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final futureEnabled = ref.watch(futureDepartmentsEnabledProvider);
    final isUrdu = ref.watch(localeProvider).languageCode == 'ur';
    final isDark = ref.watch(themeModeProvider) == ThemeMode.dark;

    final activeDepts = MockSeedData.departments
        .where((d) => d.isActive || (futureEnabled && d.id == 'dept_footwear'))
        .toList();
    final activeCategories = MockSeedData.categories
        .where(
          (c) =>
              c.departmentId == _selectedDeptId &&
              (c.isActive || futureEnabled),
        )
        .toList();
    final schema = _selectedDeptId == 'dept_footwear'
        ? MockSeedData.attributeSchemas[1]
        : MockSeedData.attributeSchemas[0];
    final sampleProduct = MockSeedData.products.first;

    return Scaffold(
      appBar: AppBar(
        title: const PehrawanLogo(horizontal: true, markSize: 28),
        actions: [
          IconButton(
            tooltip: 'Toggle Language (EN / اردو)',
            onPressed: () {
              ref.read(localeProvider.notifier).state = isUrdu
                  ? const Locale('en')
                  : const Locale('ur');
            },
            icon: const Icon(Icons.translate_rounded),
          ),
          IconButton(
            tooltip: 'Toggle Light / Dark',
            onPressed: () {
              ref.read(themeModeProvider.notifier).state = isDark
                  ? ThemeMode.light
                  : ThemeMode.dark;
            },
            icon: Icon(
              isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          if (_showOffline)
            OfflineBanner(onRetry: () => setState(() => _showOffline = false)),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenMargin,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.designSystemShowcase,
                        style: theme.textTheme.headlineMedium,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(l10n.enableFutureDepartments),
                        subtitle: const Text(
                          'Toggles Footwear department & EU shoe size schema',
                        ),
                        value: futureEnabled,
                        onChanged: (val) {
                          ref
                                  .read(
                                    futureDepartmentsEnabledProvider.notifier,
                                  )
                                  .state =
                              val;
                          if (!val && _selectedDeptId != 'dept_fashion') {
                            setState(() => _selectedDeptId = 'dept_fashion');
                          }
                        },
                      ),
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Preview Offline Banner'),
                        value: _showOffline,
                        onChanged: (val) => setState(() => _showOffline = val),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                SectionHeader(title: 'DepartmentTabBar', onSeeAll: () {}),
                const SizedBox(height: AppSpacing.xs),
                DepartmentTabBar(
                  departments: activeDepts,
                  selectedDepartmentId: _selectedDeptId,
                  onSelected: (dept) => setState(() {
                    _selectedDeptId = dept.id;
                    _selectedVariant = dept.id == 'dept_footwear'
                        ? {'size': 'EU 38', 'color': 'Tan'}
                        : {'size': 'M', 'color': 'Crimson'};
                  }),
                ),
                const SizedBox(height: AppSpacing.lg),
                const SectionHeader(title: 'CategoryCircle'),
                const SizedBox(height: AppSpacing.xs),
                SizedBox(
                  height: 112,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenMargin,
                    ),
                    itemCount: activeCategories.length,
                    separatorBuilder: (_, _) =>
                        const SizedBox(width: AppSpacing.sm),
                    itemBuilder: (_, i) => CategoryCircle(
                      category: activeCategories[i],
                      onTap: () {},
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenMargin,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Buttons', style: theme.textTheme.headlineSmall),
                      const SizedBox(height: AppSpacing.sm),
                      AppButton(label: 'Primary Button', onPressed: () {}),
                      const SizedBox(height: AppSpacing.xs),
                      AppButton(
                        label: 'Outlined Button',
                        variant: AppButtonVariant.outlined,
                        onPressed: () {},
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      AppButton(
                        label: 'Ghost Button',
                        variant: AppButtonVariant.ghost,
                        onPressed: () {},
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      const Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              label: 'Loading',
                              isLoading: true,
                              onPressed: null,
                            ),
                          ),
                          SizedBox(width: AppSpacing.xs),
                          Expanded(
                            child: AppButton(
                              label: 'Disabled',
                              onPressed: null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      AppTextField(
                        controller: _textController,
                        label: 'AppTextField',
                        hint: l10n.searchHint,
                        prefixIcon: const Icon(Icons.search_rounded),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Text(
                        'PriceText, DiscountBadge & RatingStars',
                        style: theme.textTheme.headlineSmall,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      const PriceText(price: 5490, oldPrice: 6850, large: true),
                      const SizedBox(height: AppSpacing.xs),
                      const RatingStars(rating: 4.7, reviewCount: 92),
                      const SizedBox(height: AppSpacing.lg),
                      Text(
                        'VariantSelector (${schema.name})',
                        style: theme.textTheme.headlineSmall,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      VariantSelector(
                        schema: schema,
                        selectedOptions: _selectedVariant,
                        variants: sampleProduct.variants,
                        onOptionSelected: (k, v) {
                          setState(() {
                            _selectedVariant = {..._selectedVariant, k: v};
                          });
                        },
                      ),
                      const TrustBadgeRow(),
                      const SizedBox(height: AppSpacing.lg),
                      Row(
                        children: [
                          Text(
                            l10n.flashSale,
                            style: theme.textTheme.headlineSmall,
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          FlashSaleTimer(
                            endTime: DateTime.now().add(
                              const Duration(hours: 5, minutes: 21),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.md),
                      SizedBox(
                        width: 190,
                        child: ProductCard(
                          product: sampleProduct,
                          isWishlisted: _isWishlisted,
                          onWishlistTap: () =>
                              setState(() => _isWishlisted = !_isWishlisted),
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      WalletCard(balanceRupees: 2500, onTopUp: () {}),
                      const SizedBox(height: AppSpacing.lg),
                      Text(
                        'OrderTimeline',
                        style: theme.textTheme.headlineSmall,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      OrderTimeline(
                        steps: MockSeedData.sampleOrders.first.timeline,
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      AppButton(
                        label: 'Open BottomSheetScaffold',
                        variant: AppButtonVariant.outlined,
                        onPressed: () {
                          BottomSheetScaffold.show<void>(
                            context: context,
                            title: 'Filter Options',
                            child: const Text(
                              'Schema-driven filters will render here.',
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Text(
                        'SkeletonLoader',
                        style: theme.textTheme.headlineSmall,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                    ],
                  ),
                ),
                const SkeletonProductGrid(itemCount: 2),
                const SizedBox(height: AppSpacing.lg),
                EmptyState(
                  icon: Icons.shopping_bag_outlined,
                  title: l10n.emptyCartTitle,
                  subtitle: l10n.emptyCartSubtitle,
                  actionLabel: l10n.shopNow,
                  onAction: () {},
                ),
                ErrorState(onRetry: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
