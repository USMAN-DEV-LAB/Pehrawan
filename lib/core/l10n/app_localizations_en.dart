// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Pehrawan';

  @override
  String get tagline => 'Fashion, your way';

  @override
  String get currencyPrefix => 'Rs.';

  @override
  String get home => 'Home';

  @override
  String get categories => 'Categories';

  @override
  String get offers => 'Offers';

  @override
  String get cart => 'Cart';

  @override
  String get profile => 'Profile';

  @override
  String get searchHint => 'Search for lawn, kurtas, formal wear...';

  @override
  String get flashSale => 'Flash Sale';

  @override
  String get justForYou => 'Just For You';

  @override
  String get seeAll => 'See All';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String get buyNow => 'Buy Now';

  @override
  String get outOfStock => 'Out of Stock';

  @override
  String get inStock => 'In Stock';

  @override
  String get codAvailable => 'Cash on Delivery Available';

  @override
  String returnPolicyDays(int days) {
    return '$days-Day Easy Returns';
  }

  @override
  String get originalGuarantee => '100% Original';

  @override
  String get codLabel => 'Cash on Delivery';

  @override
  String get emptyCartTitle => 'Your cart is empty';

  @override
  String get emptyCartSubtitle =>
      'Looks like you haven\'t added anything to your cart yet.';

  @override
  String get shopNow => 'Shop Now';

  @override
  String get retry => 'Retry';

  @override
  String get offlineMessage => 'You are offline. Showing cached items.';

  @override
  String get noInternetTitle => 'No Internet Connection';

  @override
  String get noInternetSubtitle =>
      'Please check your Wi-Fi or mobile data and try again.';

  @override
  String get errorGenericTitle => 'Something went wrong';

  @override
  String get errorGenericSubtitle =>
      'We couldn\'t load this right now. Please try again.';

  @override
  String get designSystemShowcase => 'Design System Showcase';

  @override
  String get developerTools => 'Developer Tools';

  @override
  String get enableFutureDepartments =>
      'Enable Future Departments (Scalability Proof)';

  @override
  String offPercent(int percent) {
    return '$percent% OFF';
  }

  @override
  String get walletTitle => 'Pehrawan Wallet';

  @override
  String get walletBalance => 'Available Balance';

  @override
  String get topUp => 'Top Up';

  @override
  String get orderPlaced => 'Order Placed';

  @override
  String get orderPacked => 'Packed';

  @override
  String get orderShipped => 'Shipped';

  @override
  String get orderOutForDelivery => 'Out for Delivery';

  @override
  String get orderDelivered => 'Delivered';

  @override
  String get skip => 'Skip';

  @override
  String get next => 'Next';

  @override
  String get getStarted => 'Get Started';

  @override
  String get continueAsGuest => 'Continue as guest';

  @override
  String get languageSelectTitle => 'Choose your language';

  @override
  String get english => 'English';

  @override
  String get urdu => 'اردو';

  @override
  String get phoneRequired => 'Please enter your mobile number';

  @override
  String get phoneInvalid =>
      'Enter a valid Pakistani mobile number (03XXXXXXXXX or +923XXXXXXXXX)';

  @override
  String get otpRequired => 'Please enter the 6-digit OTP';

  @override
  String get otpInvalid => 'OTP must be 6 digits';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get invalidEmail => 'Please enter a valid email address';
}
