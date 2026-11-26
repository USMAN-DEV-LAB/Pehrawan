import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ur'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Pehrawan'**
  String get appName;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'Fashion, your way'**
  String get tagline;

  /// No description provided for @currencyPrefix.
  ///
  /// In en, this message translates to:
  /// **'Rs.'**
  String get currencyPrefix;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @offers.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get offers;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search for lawn, kurtas, formal wear...'**
  String get searchHint;

  /// No description provided for @flashSale.
  ///
  /// In en, this message translates to:
  /// **'Flash Sale'**
  String get flashSale;

  /// No description provided for @justForYou.
  ///
  /// In en, this message translates to:
  /// **'Just For You'**
  String get justForYou;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @buyNow.
  ///
  /// In en, this message translates to:
  /// **'Buy Now'**
  String get buyNow;

  /// No description provided for @outOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of Stock'**
  String get outOfStock;

  /// No description provided for @inStock.
  ///
  /// In en, this message translates to:
  /// **'In Stock'**
  String get inStock;

  /// No description provided for @codAvailable.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery Available'**
  String get codAvailable;

  /// No description provided for @returnPolicyDays.
  ///
  /// In en, this message translates to:
  /// **'{days}-Day Easy Returns'**
  String returnPolicyDays(int days);

  /// No description provided for @originalGuarantee.
  ///
  /// In en, this message translates to:
  /// **'100% Original'**
  String get originalGuarantee;

  /// No description provided for @codLabel.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery'**
  String get codLabel;

  /// No description provided for @emptyCartTitle.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get emptyCartTitle;

  /// No description provided for @emptyCartSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Looks like you haven\'t added anything to your cart yet.'**
  String get emptyCartSubtitle;

  /// No description provided for @shopNow.
  ///
  /// In en, this message translates to:
  /// **'Shop Now'**
  String get shopNow;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @offlineMessage.
  ///
  /// In en, this message translates to:
  /// **'You are offline. Showing cached items.'**
  String get offlineMessage;

  /// No description provided for @noInternetTitle.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get noInternetTitle;

  /// No description provided for @noInternetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please check your Wi-Fi or mobile data and try again.'**
  String get noInternetSubtitle;

  /// No description provided for @errorGenericTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorGenericTitle;

  /// No description provided for @errorGenericSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t load this right now. Please try again.'**
  String get errorGenericSubtitle;

  /// No description provided for @designSystemShowcase.
  ///
  /// In en, this message translates to:
  /// **'Design System Showcase'**
  String get designSystemShowcase;

  /// No description provided for @developerTools.
  ///
  /// In en, this message translates to:
  /// **'Developer Tools'**
  String get developerTools;

  /// No description provided for @enableFutureDepartments.
  ///
  /// In en, this message translates to:
  /// **'Enable Future Departments (Scalability Proof)'**
  String get enableFutureDepartments;

  /// No description provided for @offPercent.
  ///
  /// In en, this message translates to:
  /// **'{percent}% OFF'**
  String offPercent(int percent);

  /// No description provided for @walletTitle.
  ///
  /// In en, this message translates to:
  /// **'Pehrawan Wallet'**
  String get walletTitle;

  /// No description provided for @walletBalance.
  ///
  /// In en, this message translates to:
  /// **'Available Balance'**
  String get walletBalance;

  /// No description provided for @topUp.
  ///
  /// In en, this message translates to:
  /// **'Top Up'**
  String get topUp;

  /// No description provided for @orderPlaced.
  ///
  /// In en, this message translates to:
  /// **'Order Placed'**
  String get orderPlaced;

  /// No description provided for @orderPacked.
  ///
  /// In en, this message translates to:
  /// **'Packed'**
  String get orderPacked;

  /// No description provided for @orderShipped.
  ///
  /// In en, this message translates to:
  /// **'Shipped'**
  String get orderShipped;

  /// No description provided for @orderOutForDelivery.
  ///
  /// In en, this message translates to:
  /// **'Out for Delivery'**
  String get orderOutForDelivery;

  /// No description provided for @orderDelivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get orderDelivered;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @continueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get continueAsGuest;

  /// No description provided for @languageSelectTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get languageSelectTitle;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @urdu.
  ///
  /// In en, this message translates to:
  /// **'اردو'**
  String get urdu;

  /// No description provided for @phoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your mobile number'**
  String get phoneRequired;

  /// No description provided for @phoneInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid Pakistani mobile number (03XXXXXXXXX or +923XXXXXXXXX)'**
  String get phoneInvalid;

  /// No description provided for @otpRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter the 6-digit OTP'**
  String get otpRequired;

  /// No description provided for @otpInvalid.
  ///
  /// In en, this message translates to:
  /// **'OTP must be 6 digits'**
  String get otpInvalid;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get invalidEmail;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Discover Your Style'**
  String get onboardingTitle1;

  /// No description provided for @onboardingSubtitle1.
  ///
  /// In en, this message translates to:
  /// **'Curated Pakistani lawn, kurtas, pret and festive wear from trusted artisans.'**
  String get onboardingSubtitle1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Great Deals Every Day'**
  String get onboardingTitle2;

  /// No description provided for @onboardingSubtitle2.
  ///
  /// In en, this message translates to:
  /// **'Flash sales, seasonal vouchers and honest pricing in Rupees.'**
  String get onboardingSubtitle2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery'**
  String get onboardingTitle3;

  /// No description provided for @onboardingSubtitle3.
  ///
  /// In en, this message translates to:
  /// **'Pay at your doorstep across Pakistan with 7-day easy returns.'**
  String get onboardingSubtitle3;

  /// No description provided for @languageSelectSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You can change this anytime in your profile settings.'**
  String get languageSelectSubtitle;

  /// No description provided for @continueLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueLabel;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to Pehrawan'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your Pakistani mobile number to receive a 6-digit OTP.'**
  String get loginSubtitle;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumber;

  /// No description provided for @mobileNumberHint.
  ///
  /// In en, this message translates to:
  /// **'0300 1234567'**
  String get mobileNumberHint;

  /// No description provided for @sendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtp;

  /// No description provided for @otpVerification.
  ///
  /// In en, this message translates to:
  /// **'OTP Verification'**
  String get otpVerification;

  /// No description provided for @otpSentTo.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code sent to {phone}'**
  String otpSentTo(String phone);

  /// No description provided for @resendOtpIn.
  ///
  /// In en, this message translates to:
  /// **'Resend code in {seconds}s'**
  String resendOtpIn(int seconds);

  /// No description provided for @resendOtp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get resendOtp;

  /// No description provided for @verifyAndContinue.
  ///
  /// In en, this message translates to:
  /// **'Verify & Continue'**
  String get verifyAndContinue;

  /// No description provided for @changeNumber.
  ///
  /// In en, this message translates to:
  /// **'Change number'**
  String get changeNumber;

  /// No description provided for @orContinueWith.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get orContinueWith;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get signInWithGoogle;

  /// No description provided for @mockOtpHint.
  ///
  /// In en, this message translates to:
  /// **'Mock mode: enter any 6 digits (e.g. 123456)'**
  String get mockOtpHint;

  /// No description provided for @homePlaceholderTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Pehrawan'**
  String get homePlaceholderTitle;

  /// No description provided for @homePlaceholderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Home, Categories, and Search will be built in Phase 3.'**
  String get homePlaceholderSubtitle;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @vouchersTitle.
  ///
  /// In en, this message translates to:
  /// **'Vouchers For You'**
  String get vouchersTitle;

  /// No description provided for @copyCode.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copyCode;

  /// No description provided for @codeCopied.
  ///
  /// In en, this message translates to:
  /// **'Voucher code {code} copied'**
  String codeCopied(String code);

  /// No description provided for @minSpend.
  ///
  /// In en, this message translates to:
  /// **'Min. spend {amount}'**
  String minSpend(String amount);

  /// No description provided for @sortPopular.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get sortPopular;

  /// No description provided for @sortPriceLow.
  ///
  /// In en, this message translates to:
  /// **'Price: Low to High'**
  String get sortPriceLow;

  /// No description provided for @sortPriceHigh.
  ///
  /// In en, this message translates to:
  /// **'Price: High to Low'**
  String get sortPriceHigh;

  /// No description provided for @sortRating.
  ///
  /// In en, this message translates to:
  /// **'Top Rated'**
  String get sortRating;

  /// No description provided for @filters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// No description provided for @applyFilters.
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get applyFilters;

  /// No description provided for @clearFilters.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearFilters;

  /// No description provided for @noProductsTitle.
  ///
  /// In en, this message translates to:
  /// **'No products found'**
  String get noProductsTitle;

  /// No description provided for @noProductsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your filters or search query.'**
  String get noProductsSubtitle;

  /// No description provided for @recentSearches.
  ///
  /// In en, this message translates to:
  /// **'Recent Searches'**
  String get recentSearches;

  /// No description provided for @clearHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clearHistory;

  /// No description provided for @trendingTags.
  ///
  /// In en, this message translates to:
  /// **'Trending Now'**
  String get trendingTags;

  /// No description provided for @searchSuggestions.
  ///
  /// In en, this message translates to:
  /// **'Suggestions'**
  String get searchSuggestions;

  /// No description provided for @resultsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String resultsCount(int count);

  /// No description provided for @viewAllInCategory.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAllInCategory;

  /// No description provided for @allProducts.
  ///
  /// In en, this message translates to:
  /// **'All Products'**
  String get allProducts;

  /// No description provided for @wishlistTitle.
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get wishlistTitle;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @comingSoonPhase.
  ///
  /// In en, this message translates to:
  /// **'Coming in next phase'**
  String get comingSoonPhase;

  /// No description provided for @cameraSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Visual search permission will be requested when enabled.'**
  String get cameraSearchHint;

  /// No description provided for @voiceSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Voice search permission will be requested when enabled.'**
  String get voiceSearchHint;

  /// No description provided for @futureDeptsOn.
  ///
  /// In en, this message translates to:
  /// **'Future departments enabled (Footwear & Bags)'**
  String get futureDeptsOn;

  /// No description provided for @futureDeptsOff.
  ///
  /// In en, this message translates to:
  /// **'Future departments disabled (Launch mode)'**
  String get futureDeptsOff;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
