import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/widgets/widgets.dart';
import 'package:pehrawan/features/catalog/domain/entities/catalog_entities.dart';
import 'package:pehrawan/features/catalog/presentation/providers/catalog_providers.dart';

/// Schema-driven filter sheet.
/// Renders clothing sizes (XS..XL) for clothing schemas and EU shoe sizes
/// (EU 37..42) for footwear schemas automatically.
class SchemaFilterSheet extends ConsumerStatefulWidget {
  const SchemaFilterSheet({
    super.key,
    required this.schemaId,
    required this.initialFilters,
    required this.onApply,
  });

  final String schemaId;
  final Map<String, String> initialFilters;
  final ValueChanged<Map<String, String>> onApply;

  static Future<void> show({
    required BuildContext context,
    required String schemaId,
    required Map<String, String> initialFilters,
    required ValueChanged<Map<String, String>> onApply,
  }) {
    return BottomSheetScaffold.show<void>(
      context: context,
      title: context.l10n.filters,
      child: SchemaFilterSheet(
        schemaId: schemaId,
        initialFilters: initialFilters,
        onApply: onApply,
      ),
    );
  }

  @override
  ConsumerState<SchemaFilterSheet> createState() => _SchemaFilterSheetState();
}

class _SchemaFilterSheetState extends ConsumerState<SchemaFilterSheet> {
  late Map<String, String> _selected;

  @override
  void initState() {
    super.initState();
    _selected = Map<String, String>.from(widget.initialFilters);
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
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final langCode = context.isUrdu ? 'ur' : 'en';
    final schemaAsync = ref.watch(attributeSchemaProvider(widget.schemaId));

    return schemaAsync.when(
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: AppSpacing.lg),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, _) => ErrorState(
        onRetry: () => ref.invalidate(attributeSchemaProvider(widget.schemaId)),
      ),
      data: (schema) {
        if (schema == null || schema.attributes.isEmpty) {
          return EmptyState(
            icon: Icons.tune_rounded,
            title: l10n.filters,
            subtitle: l10n.noProductsSubtitle,
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final attr in schema.attributes) ...[
              Text(
                attr.localizedLabel(langCode),
                style: theme.textTheme.titleSmall,
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
                        selected: _selected[attr.key] == val.value,
                        onTap: () => setState(() {
                          if (_selected[attr.key] == val.value) {
                            _selected.remove(attr.key);
                          } else {
                            _selected[attr.key] = val.value;
                          }
                        }),
                      )
                    else
                      SizeChip(
                        label: val.localizedLabel(langCode),
                        selected: _selected[attr.key] == val.value,
                        onTap: () => setState(() {
                          if (_selected[attr.key] == val.value) {
                            _selected.remove(attr.key);
                          } else {
                            _selected[attr.key] = val.value;
                          }
                        }),
                      ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
            ],
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: l10n.clearFilters,
                    variant: AppButtonVariant.outlined,
                    onPressed: () {
                      setState(() => _selected.clear());
                      widget.onApply(const {});
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: AppButton(
                    label: l10n.applyFilters,
                    onPressed: () {
                      widget.onApply(
                        Map<String, String>.unmodifiable(_selected),
                      );
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
