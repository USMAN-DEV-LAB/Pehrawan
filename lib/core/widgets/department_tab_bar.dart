import 'package:flutter/material.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/features/catalog/domain/entities/catalog_entities.dart';

/// Horizontal scrollable tab bar driven solely by active [Department] records.
class DepartmentTabBar extends StatelessWidget {
  const DepartmentTabBar({
    super.key,
    required this.departments,
    required this.selectedDepartmentId,
    required this.onSelected,
  });

  final List<Department> departments;
  final String selectedDepartmentId;
  final ValueChanged<Department> onSelected;

  IconData _iconForName(String iconName) {
    return switch (iconName) {
      'checkroom' => Icons.checkroom_rounded,
      'shoe' => Icons.ice_skating_rounded,
      'bag' => Icons.shopping_bag_outlined,
      'home' => Icons.chair_outlined,
      'devices' => Icons.devices_other_rounded,
      _ => Icons.category_outlined,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final ext = context.ext;
    final langCode = context.isUrdu ? 'ur' : 'en';

    return SizedBox(
      height: AppSpacing.minTapTarget,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenMargin,
        ),
        itemCount: departments.length,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.xs),
        itemBuilder: (context, index) {
          final dept = departments[index];
          final isSelected = dept.id == selectedDepartmentId;
          final label = dept.localizedName(langCode);

          return Semantics(
            button: true,
            selected: isSelected,
            label: label,
            child: InkWell(
              onTap: () => onSelected(dept),
              borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? colors.primary : ext.surfaceGrey,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _iconForName(dept.icon),
                      size: 16,
                      color: isSelected ? colors.onPrimary : colors.onSurface,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      label,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: isSelected ? colors.onPrimary : colors.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
