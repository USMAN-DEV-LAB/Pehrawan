import 'package:intl/intl.dart';

/// Money & discount utilities.
/// All monetary values are stored as integer rupees (never double).
abstract final class MoneyUtils {
  static final NumberFormat _rupeeFormat = NumberFormat('#,##0', 'en_US');

  /// Formats integer rupees as "Rs. 6,850".
  static String formatPkr(int amountRupees, {String prefix = 'Rs.'}) {
    final safeAmount = amountRupees < 0 ? 0 : amountRupees;
    return '$prefix ${_rupeeFormat.format(safeAmount)}';
  }

  /// Calculates discount percentage: round((old - sale) / old * 100).
  /// Returns 0 if [salePrice] >= [basePrice] or [basePrice] <= 0.
  static int discountPercent({required int basePrice, required int salePrice}) {
    if (basePrice <= 0 || salePrice >= basePrice || salePrice < 0) {
      return 0;
    }
    return (((basePrice - salePrice) / basePrice) * 100).round();
  }
}
