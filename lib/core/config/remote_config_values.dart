/// Centralized runtime configuration values, designed to be overridden
/// by Firebase Remote Config in Phase 6 without changing business logic.
class RemoteConfigValues {
  const RemoteConfigValues({
    this.deliveryFeeRupees = 200,
    this.freeDeliveryThresholdRupees = 5000,
    this.enableJazzCash = false,
    this.enableEasypaisa = false,
    this.enableCardPayments = false,
  });

  final int deliveryFeeRupees;
  final int freeDeliveryThresholdRupees;
  final bool enableJazzCash;
  final bool enableEasypaisa;
  final bool enableCardPayments;

  RemoteConfigValues copyWith({
    int? deliveryFeeRupees,
    int? freeDeliveryThresholdRupees,
    bool? enableJazzCash,
    bool? enableEasypaisa,
    bool? enableCardPayments,
  }) {
    return RemoteConfigValues(
      deliveryFeeRupees: deliveryFeeRupees ?? this.deliveryFeeRupees,
      freeDeliveryThresholdRupees:
          freeDeliveryThresholdRupees ?? this.freeDeliveryThresholdRupees,
      enableJazzCash: enableJazzCash ?? this.enableJazzCash,
      enableEasypaisa: enableEasypaisa ?? this.enableEasypaisa,
      enableCardPayments: enableCardPayments ?? this.enableCardPayments,
    );
  }
}
