import 'package:flutter/material.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/features/catalog/domain/entities/catalog_entities.dart';

import 'size_chip.dart';

/// Generic variant selector driven by an [AttributeSchema].
/// Renders clothing sizes, EU/UK shoe sizes, colors, or any future attribute
/// with zero code changes.
class VariantSelector extends StatelessWidget {
  const VariantSelector({
    super.key,
    required this.schema,
    required this.selectedOptions,
    required this.variants,
    required this.onOptionSelected,
  });

  final AttributeSchema schema;
  final Map<String, String> selectedOptions;
  final List<ProductVariant> variants;
  final void Function(String key, String value) onOptionSelected;

  bool _isValueInStock(String key, String value) {
    if (variants.isEmpty) return true;
    return variants.any((v) => v.options[key] == value && v.stock > 0);
  }

  Color _parseHexColor(String? hex, Color fallback) {
    if (hex == null || hex.isEmpty) return fallback;
    final clean = hex.replaceFirst('#', '');
    final buffer = StringBuffer();
    if (clean.length == 6) buffer.write('FF');
    buffer.write(clean);
    final parsed = int.tryParse(buffer.toString(), radix: 16);
    return parsed != null ? Color(parsed) : fallback;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final langCode = context.isUrdu ? 'ur' : 'en';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final attr in schema.attributes) ...[
          Row(
            children: [
              Text(
                attr.localizedLabel(langCode),
                style: theme.textTheme.titleSmall,
              ),
              if (selectedOptions[attr.key] != null) ...[
                const SizedBox(width: AppSpacing.xs),
                Text(
                  ': ${selectedOptions[attr.key]}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              for (final val in attr.values)
                if (attr.type == AttributeDisplayType.swatch)
                  AppColorSwatch(
                    color: _parseHexColor(
                      val.colorHex,
                      theme.colorScheme.primary,
                    ),
                    label: val.localizedLabel(langCode),
                    selected: selectedOptions[attr.key] == val.value,
                    enabled: _isValueInStock(attr.key, val.value),
                    onTap: () => onOptionSelected(attr.key, val.value),
                  )
                else
                  SizeChip(
                    label: val.localizedLabel(langCode),
                    selected: selectedOptions[attr.key] == val.value,
                    enabled: _isValueInStock(attr.key, val.value),
                    onTap: () => onOptionSelected(attr.key, val.value),
                  ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
        ],
      ],
    );
  }
}
