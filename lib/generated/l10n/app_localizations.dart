import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_th.dart';

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
    Locale('th')
  ];

  /// No description provided for @appName.
  ///
  /// In th, this message translates to:
  /// **'T-POP'**
  String get appName;

  /// No description provided for @purchasePackage.
  ///
  /// In th, this message translates to:
  /// **'ซื้อแพ็กเกจ'**
  String get purchasePackage;

  /// No description provided for @purchaseHistory.
  ///
  /// In th, this message translates to:
  /// **'ประวัติการซื้อ'**
  String get purchaseHistory;

  /// No description provided for @selectPackage.
  ///
  /// In th, this message translates to:
  /// **'แพ็กเกจ T-POP Premium'**
  String get selectPackage;

  /// No description provided for @packageDescription.
  ///
  /// In th, this message translates to:
  /// **'แพ็กเกจ T-POP Premium คือแพ็กเกจสมาชิกแบบมีค่าใช้จ่าย โดยแบ่งเป็น {packageCount} แพ็กเกจ'**
  String packageDescription(Object packageCount);

  /// No description provided for @perYear.
  ///
  /// In th, this message translates to:
  /// **'/ ปี'**
  String get perYear;

  /// No description provided for @perMonth.
  ///
  /// In th, this message translates to:
  /// **'/ เดือน'**
  String get perMonth;

  /// No description provided for @buyNow.
  ///
  /// In th, this message translates to:
  /// **'ซื้อเลย'**
  String get buyNow;

  /// No description provided for @mostPopular.
  ///
  /// In th, this message translates to:
  /// **'ยอดนิยม'**
  String get mostPopular;

  /// No description provided for @bestValue.
  ///
  /// In th, this message translates to:
  /// **'คุ้มที่สุด'**
  String get bestValue;

  /// No description provided for @features.
  ///
  /// In th, this message translates to:
  /// **'สิ่งที่ได้รับ'**
  String get features;

  /// No description provided for @loading.
  ///
  /// In th, this message translates to:
  /// **'กำลังโหลด...'**
  String get loading;

  /// No description provided for @errorOccurred.
  ///
  /// In th, this message translates to:
  /// **'เกิดข้อผิดพลาด'**
  String get errorOccurred;

  /// No description provided for @retry.
  ///
  /// In th, this message translates to:
  /// **'ลองใหม่'**
  String get retry;

  /// No description provided for @noPackagesAvailable.
  ///
  /// In th, this message translates to:
  /// **'ไม่มีแพ็กเกจ'**
  String get noPackagesAvailable;

  /// No description provided for @noPackagesDescription.
  ///
  /// In th, this message translates to:
  /// **'กรุณาตรวจสอบในภายหลัง'**
  String get noPackagesDescription;

  /// No description provided for @purchaseSuccess.
  ///
  /// In th, this message translates to:
  /// **'ซื้อสำเร็จ!'**
  String get purchaseSuccess;

  /// No description provided for @purchaseSuccessDesc.
  ///
  /// In th, this message translates to:
  /// **'การสมัครสมาชิกของคุณเปิดใช้งานแล้ว'**
  String get purchaseSuccessDesc;

  /// No description provided for @purchaseError.
  ///
  /// In th, this message translates to:
  /// **'ซื้อไม่สำเร็จ'**
  String get purchaseError;

  /// No description provided for @close.
  ///
  /// In th, this message translates to:
  /// **'ปิด'**
  String get close;

  /// No description provided for @currentPlan.
  ///
  /// In th, this message translates to:
  /// **'แผนปัจจุบัน'**
  String get currentPlan;

  /// No description provided for @expiredPlan.
  ///
  /// In th, this message translates to:
  /// **'หมดอายุ'**
  String get expiredPlan;

  /// No description provided for @activeSubscriptions.
  ///
  /// In th, this message translates to:
  /// **'การสมัครที่ใช้งานอยู่'**
  String get activeSubscriptions;

  /// No description provided for @expiredSubscriptions.
  ///
  /// In th, this message translates to:
  /// **'การสมัครที่หมดอายุแล้ว'**
  String get expiredSubscriptions;

  /// No description provided for @noHistory.
  ///
  /// In th, this message translates to:
  /// **'ไม่มีประวัติการซื้อ'**
  String get noHistory;

  /// No description provided for @noHistoryDescription.
  ///
  /// In th, this message translates to:
  /// **'คุณยังไม่เคยซื้อแพ็กเกจ'**
  String get noHistoryDescription;

  /// No description provided for @purchaseDate.
  ///
  /// In th, this message translates to:
  /// **'วันที่ซื้อ'**
  String get purchaseDate;

  /// No description provided for @expiryDate.
  ///
  /// In th, this message translates to:
  /// **'วันหมดอายุ'**
  String get expiryDate;

  /// No description provided for @paymentMethod.
  ///
  /// In th, this message translates to:
  /// **'ช่องทางชำระเงิน'**
  String get paymentMethod;

  /// No description provided for @orderId.
  ///
  /// In th, this message translates to:
  /// **'รหัสคำสั่งซื้อ'**
  String get orderId;

  /// No description provided for @amount.
  ///
  /// In th, this message translates to:
  /// **'จำนวนเงิน'**
  String get amount;

  /// No description provided for @status.
  ///
  /// In th, this message translates to:
  /// **'สถานะ'**
  String get status;

  /// No description provided for @active.
  ///
  /// In th, this message translates to:
  /// **'ใช้งานอยู่'**
  String get active;

  /// No description provided for @expired.
  ///
  /// In th, this message translates to:
  /// **'หมดอายุ'**
  String get expired;

  /// No description provided for @daysRemaining.
  ///
  /// In th, this message translates to:
  /// **'เหลืออีก {days} วัน'**
  String daysRemaining(int days);

  /// No description provided for @language.
  ///
  /// In th, this message translates to:
  /// **'ภาษา'**
  String get language;

  /// No description provided for @thai.
  ///
  /// In th, this message translates to:
  /// **'ภาษาไทย'**
  String get thai;

  /// No description provided for @english.
  ///
  /// In th, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @confirmPurchase.
  ///
  /// In th, this message translates to:
  /// **'ยืนยันการซื้อ'**
  String get confirmPurchase;

  /// No description provided for @confirmPurchaseDesc.
  ///
  /// In th, this message translates to:
  /// **'คุณต้องการซื้อ {packageName} ในราคา {price} ใช่หรือไม่?'**
  String confirmPurchaseDesc(String packageName, String price);

  /// No description provided for @cancel.
  ///
  /// In th, this message translates to:
  /// **'ยกเลิก'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In th, this message translates to:
  /// **'ยืนยัน'**
  String get confirm;

  /// No description provided for @creditCard.
  ///
  /// In th, this message translates to:
  /// **'บัตรเครดิต'**
  String get creditCard;

  /// No description provided for @applePay.
  ///
  /// In th, this message translates to:
  /// **'Apple Pay'**
  String get applePay;

  /// No description provided for @googlePay.
  ///
  /// In th, this message translates to:
  /// **'Google Pay'**
  String get googlePay;

  /// No description provided for @promptPay.
  ///
  /// In th, this message translates to:
  /// **'พร้อมเพย์'**
  String get promptPay;

  /// No description provided for @unlimited.
  ///
  /// In th, this message translates to:
  /// **'ไม่จำกัด'**
  String get unlimited;

  /// No description provided for @gb.
  ///
  /// In th, this message translates to:
  /// **'GB'**
  String get gb;

  /// No description provided for @startDate.
  ///
  /// In th, this message translates to:
  /// **'วันที่เริ่มต้น'**
  String get startDate;

  /// No description provided for @viewDetails.
  ///
  /// In th, this message translates to:
  /// **'ดูรายละเอียด'**
  String get viewDetails;

  /// No description provided for @packageDetails.
  ///
  /// In th, this message translates to:
  /// **'รายละเอียดแพ็กเกจ'**
  String get packageDetails;
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
      <String>['en', 'th'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'th':
      return AppLocalizationsTh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
