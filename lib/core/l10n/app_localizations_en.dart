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

  @override
  String get onboardingTitle1 => 'Discover Your Style';

  @override
  String get onboardingSubtitle1 =>
      'Curated Pakistani lawn, kurtas, pret and festive wear from trusted artisans.';

  @override
  String get onboardingTitle2 => 'Great Deals Every Day';

  @override
  String get onboardingSubtitle2 =>
      'Flash sales, seasonal vouchers and honest pricing in Rupees.';

  @override
  String get onboardingTitle3 => 'Cash on Delivery';

  @override
  String get onboardingSubtitle3 =>
      'Pay at your doorstep across Pakistan with 7-day easy returns.';

  @override
  String get languageSelectSubtitle =>
      'You can change this anytime in your profile settings.';

  @override
  String get continueLabel => 'Continue';

  @override
  String get loginTitle => 'Sign in to Pehrawan';

  @override
  String get loginSubtitle =>
      'Enter your Pakistani mobile number to receive a 6-digit OTP.';

  @override
  String get mobileNumber => 'Mobile Number';

  @override
  String get mobileNumberHint => '0300 1234567';

  @override
  String get sendOtp => 'Send OTP';

  @override
  String get otpVerification => 'OTP Verification';

  @override
  String otpSentTo(String phone) {
    return 'Enter the 6-digit code sent to $phone';
  }

  @override
  String resendOtpIn(int seconds) {
    return 'Resend code in ${seconds}s';
  }

  @override
  String get resendOtp => 'Resend OTP';

  @override
  String get verifyAndContinue => 'Verify & Continue';

  @override
  String get changeNumber => 'Change number';

  @override
  String get orContinueWith => 'or';

  @override
  String get signInWithGoogle => 'Continue with Google';

  @override
  String get mockOtpHint => 'Mock mode: enter any 6 digits (e.g. 123456)';

  @override
  String get homePlaceholderTitle => 'Welcome to Pehrawan';

  @override
  String get homePlaceholderSubtitle =>
      'Home, Categories, and Search will be built in Phase 3.';

  @override
  String get signOut => 'Sign Out';

  @override
  String get vouchersTitle => 'Vouchers For You';

  @override
  String get copyCode => 'Copy';

  @override
  String codeCopied(String code) {
    return 'Voucher code $code copied';
  }

  @override
  String minSpend(String amount) {
    return 'Min. spend $amount';
  }

  @override
  String get sortPopular => 'Popular';

  @override
  String get sortPriceLow => 'Price: Low to High';

  @override
  String get sortPriceHigh => 'Price: High to Low';

  @override
  String get sortRating => 'Top Rated';

  @override
  String get filters => 'Filters';

  @override
  String get applyFilters => 'Apply Filters';

  @override
  String get clearFilters => 'Clear All';

  @override
  String get noProductsTitle => 'No products found';

  @override
  String get noProductsSubtitle =>
      'Try adjusting your filters or search query.';

  @override
  String get recentSearches => 'Recent Searches';

  @override
  String get clearHistory => 'Clear';

  @override
  String get trendingTags => 'Trending Now';

  @override
  String get searchSuggestions => 'Suggestions';

  @override
  String resultsCount(int count) {
    return '$count items';
  }

  @override
  String get viewAllInCategory => 'View All';

  @override
  String get allProducts => 'All Products';

  @override
  String get wishlistTitle => 'Wishlist';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get comingSoonPhase => 'Coming in next phase';

  @override
  String get cameraSearchHint =>
      'Visual search permission will be requested when enabled.';

  @override
  String get voiceSearchHint =>
      'Voice search permission will be requested when enabled.';

  @override
  String get futureDeptsOn => 'Future departments enabled (Footwear & Bags)';

  @override
  String get futureDeptsOff => 'Future departments disabled (Launch mode)';

  @override
  String onlyNLeft(int count) {
    return 'Only $count left in stock';
  }

  @override
  String get selectAllOptions => 'Please select all required options first';

  @override
  String get addedToCart => 'Added to cart';

  @override
  String get viewCart => 'View Cart';

  @override
  String get chat => 'Chat';

  @override
  String get chatSellerHint => 'Seller chat will open here.';

  @override
  String get detailsTab => 'Details';

  @override
  String get reviewsTab => 'Reviews';

  @override
  String get qaTab => 'Q&A';

  @override
  String get similarProducts => 'Similar Products';

  @override
  String get deliveryEstimate => 'Standard Delivery';

  @override
  String soldBy(String seller) {
    return 'Sold by $seller';
  }

  @override
  String get priceDropAlert => 'Price-drop alert';

  @override
  String get emptyWishlistTitle => 'Your wishlist is empty';

  @override
  String get emptyWishlistSubtitle =>
      'Save items you love and get notified when prices drop.';

  @override
  String get promoCode => 'Promo Code';

  @override
  String get promoCodeHint => 'Enter code (e.g. PEHRAWAN10)';

  @override
  String get apply => 'Apply';

  @override
  String promoApplied(String code) {
    return 'Promo code $code applied';
  }

  @override
  String get promoInvalid => 'Invalid or expired promo code';

  @override
  String promoMinOrder(String amount) {
    return 'Minimum spend of $amount required';
  }

  @override
  String get subtotal => 'Subtotal';

  @override
  String get discount => 'Discount';

  @override
  String get deliveryFee => 'Delivery Fee';

  @override
  String get free => 'Free';

  @override
  String get total => 'Total';

  @override
  String get proceedToCheckout => 'Proceed to Checkout';

  @override
  String itemRemoved(String title) {
    return '$title removed';
  }

  @override
  String get undo => 'Undo';

  @override
  String get noReviewsYet =>
      '4.7 average rating from verified buyers across Pakistan.';

  @override
  String get qaSampleQuestion =>
      'Q: Is the fabric pure cotton/lawn?\nA: Yes, 100% original breathable fabric with neat stitching.';
}
