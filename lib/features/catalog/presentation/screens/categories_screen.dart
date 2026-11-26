import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/router/app_router.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/core/widgets/widgets.dart';
import 'package:pehrawan/features/catalog/presentation/providers/catalog_providers.dart';

/// Categories screen with scrollable left sidebar and right grid,
/// rendered 100% from repository data.
class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key});

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen> {
  String? _selectedCategoryId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final ext = context.ext;
    final langCode = context.isUrdu ? 'ur' : 'en';

    final deptsAsync = ref.watch(departmentsProvider);
    final selectedDeptId = ref.watch(selectedDepartmentIdProvider);
    final categoriesAsync = ref.watch(categoriesByDeptProvider(selectedDeptId));

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.categories),
        actions: [
          IconButton(
            tooltip: l10n.searchHint,
            onPressed: () => context.push(AppRoutes.search),
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          deptsAsync.when(
            loading: () => const SizedBox.shrink(),
            error: (_, _) => const SizedBox.shrink(),
            data: (depts) {
              if (depts.length <= 1) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                child: DepartmentTabBar(
                  departments: depts,
                  selectedDepartmentId: selectedDeptId,
                  onSelected: (dept) {
                    ref.read(selectedDepartmentIdProvider.notifier).state =
                        dept.id;
                    setState(() => _selectedCategoryId = null);
                  },
                ),
              );
            },
          ),
          const Divider(),
          Expanded(
            child: categoriesAsync.when(
              loading: () => const Padding(
                padding: EdgeInsets.all(AppSpacing.md),
                child: SkeletonProductGrid(itemCount: 4),
              ),
              error: (_, _) => ErrorState(
                onRetry: () =>
                    ref.invalidate(categoriesByDeptProvider(selectedDeptId)),
              ),
              data: (categories) {
                if (categories.isEmpty) {
                  return EmptyState(
                    icon: Icons.grid_view_outlined,
                    title: l10n.noProductsTitle,
                    subtitle: l10n.noProductsSubtitle,
                  );
                }

                final activeCat = categories.firstWhere(
                  (c) => c.id == _selectedCategoryId,
                  orElse: () => categories.first,
                );

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Left Scrollable Sidebar
                    SizedBox(
                      width: 112,
                      child: ColoredBox(
                        color: ext.surfaceGrey,
                        child: ListView.builder(
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final cat = categories[index];
                            final selected = cat.id == activeCat.id;
                            return Semantics(
                              button: true,
                              selected: selected,
                              label: cat.localizedName(langCode),
                              child: InkWell(
                                onTap: () => setState(
                                  () => _selectedCategoryId = cat.id,
                                ),
                                child: Container(
                                  constraints: const BoxConstraints(
                                    minHeight: 56,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSpacing.xs,
                                    vertical: AppSpacing.sm,
                                  ),
                                  decoration: BoxDecoration(
                                    color: selected
                                        ? colors.surface
                                        : Colors.transparent,
                                    border: Border(
                                      left: BorderSide(
                                        color: selected
                                            ? colors.primary
                                            : Colors.transparent,
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    cat.localizedName(langCode),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.labelMedium
                                        ?.copyWith(
                                          color: selected
                                              ? colors.primary
                                              : colors.onSurface,
                                          fontWeight: selected
                                              ? FontWeight.w700
                                              : FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    // Right Subcategory & Category Grid
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    activeCat.localizedName(langCode),
                                    style: theme.textTheme.titleLarge,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => context.push(
                                    '${AppRoutes.listing}?departmentId=$selectedDeptId&categoryId=${activeCat.id}&schemaId=${activeCat.attributeSchemaId ?? ''}&title=${Uri.encodeComponent(activeCat.localizedName(langCode))}',
                                  ),
                                  child: Text(l10n.viewAllInCategory),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            Expanded(
                              child: GridView.builder(
                                itemCount: categories.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: AppSpacing.sm,
                                      crossAxisSpacing: AppSpacing.sm,
                                      childAspectRatio: 0.85,
                                    ),
                                itemBuilder: (context, index) {
                                  final cat = categories[index];
                                  return Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: InkWell(
                                      onTap: () => context.push(
                                        '${AppRoutes.listing}?departmentId=$selectedDeptId&categoryId=${cat.id}&schemaId=${cat.attributeSchemaId ?? ''}&title=${Uri.encodeComponent(cat.localizedName(langCode))}',
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Expanded(
                                            child: CachedNetworkImage(
                                              imageUrl: cat.imageUrl,
                                              fit: BoxFit.cover,
                                              placeholder: (_, _) =>
                                                  const SkeletonBox(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    borderRadius: 0,
                                                  ),
                                              errorWidget: (_, _, _) =>
                                                  ColoredBox(
                                                    color: ext.blush,
                                                    child: Icon(
                                                      Icons.checkroom_outlined,
                                                      color: colors.primary,
                                                    ),
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(
                                              AppSpacing.xs,
                                            ),
                                            child: Text(
                                              cat.localizedName(langCode),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style:
                                                  theme.textTheme.labelMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
