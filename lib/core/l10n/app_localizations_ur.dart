// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appName => 'پہراوان';

  @override
  String get tagline => 'فیشن، آپ کے انداز میں';

  @override
  String get currencyPrefix => 'روپے';

  @override
  String get home => 'ہوم';

  @override
  String get categories => 'اقسام';

  @override
  String get offers => 'آفرز';

  @override
  String get cart => 'کارٹ';

  @override
  String get profile => 'پروفائل';

  @override
  String get searchHint => 'لان، کرتا، فارمل ملبوسات تلاش کریں...';

  @override
  String get flashSale => 'فلیش سیل';

  @override
  String get justForYou => 'آپ کے لیے خاص';

  @override
  String get seeAll => 'سب دیکھیں';

  @override
  String get addToCart => 'کارٹ میں شامل کریں';

  @override
  String get buyNow => 'ابھی خریدیں';

  @override
  String get outOfStock => 'اسٹاک ختم';

  @override
  String get inStock => 'دستیاب ہے';

  @override
  String get codAvailable => 'کیش آن ڈیلیوری دستیاب ہے';

  @override
  String returnPolicyDays(int days) {
    return '$days دن کی آسان واپسی';
  }

  @override
  String get originalGuarantee => '100% اصل مصنوعات';

  @override
  String get codLabel => 'کیش آن ڈیلیوری';

  @override
  String get emptyCartTitle => 'آپ کا کارٹ خالی ہے';

  @override
  String get emptyCartSubtitle =>
      'لگتا ہے آپ نے ابھی تک کارٹ میں کچھ شامل نہیں کیا۔';

  @override
  String get shopNow => 'خریداری کریں';

  @override
  String get retry => 'دوبارہ کوشش کریں';

  @override
  String get offlineMessage =>
      'آپ آف لائن ہیں۔ محفوظ کردہ اشیاء دکھائی جا رہی ہیں۔';

  @override
  String get noInternetTitle => 'انٹرنیٹ کنکشن نہیں ہے';

  @override
  String get noInternetSubtitle =>
      'براہ کرم اپنا وائی فائی یا موبائل ڈیٹا چیک کریں اور دوبارہ کوشش کریں۔';

  @override
  String get errorGenericTitle => 'کچھ غلط ہو گیا';

  @override
  String get errorGenericSubtitle =>
      'ہم ابھی اسے لوڈ نہیں کر سکے۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get designSystemShowcase => 'ڈیزائن سسٹم شوکیس';

  @override
  String get developerTools => 'ڈویلپر ٹولز';

  @override
  String get enableFutureDepartments => 'آئندہ شعبہ جات فعال کریں';

  @override
  String offPercent(int percent) {
    return '$percent% رعایت';
  }

  @override
  String get walletTitle => 'پہراوان والٹ';

  @override
  String get walletBalance => 'دستیاب بیلنس';

  @override
  String get topUp => 'رقم شامل کریں';

  @override
  String get orderPlaced => 'آرڈر موصول';

  @override
  String get orderPacked => 'پیک ہو گیا';

  @override
  String get orderShipped => 'بھیج دیا گیا';

  @override
  String get orderOutForDelivery => 'ڈیلیوری کے لیے روانہ';

  @override
  String get orderDelivered => 'پہنچا دیا گیا';

  @override
  String get skip => 'چھوڑیں';

  @override
  String get next => 'آگے';

  @override
  String get getStarted => 'شروع کریں';

  @override
  String get continueAsGuest => 'مہمان کے طور پر جاری رکھیں';

  @override
  String get languageSelectTitle => 'اپنی زبان منتخب کریں';

  @override
  String get english => 'English';

  @override
  String get urdu => 'اردو';

  @override
  String get phoneRequired => 'براہ کرم اپنا موبائل نمبر درج کریں';

  @override
  String get phoneInvalid =>
      'درست پاکستانی موبائل نمبر درج کریں (03XXXXXXXXX یا +923XXXXXXXXX)';

  @override
  String get otpRequired => 'براہ کرم 6 ہندسوں کا او ٹی پی درج کریں';

  @override
  String get otpInvalid => 'او ٹی پی 6 ہندسوں کا ہونا چاہیے';

  @override
  String get fieldRequired => 'یہ خانہ پر کرنا ضروری ہے';

  @override
  String get invalidEmail => 'براہ کرم درست ای میل درج کریں';
}
