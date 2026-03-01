// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'T-POP';

  @override
  String get purchasePackage => 'Purchase Package';

  @override
  String get purchaseHistory => 'Purchase History';

  @override
  String get selectPackage => 'Package T-POP Premium';

  @override
  String packageDescription(Object packageCount) {
    return 'The T-POP Premium package is a paid subscription package, divided into $packageCount packages.';
  }

  @override
  String get perYear => '/ year';

  @override
  String get perMonth => '/ month';

  @override
  String get buyNow => 'Buy Now';

  @override
  String get mostPopular => 'Most Popular';

  @override
  String get bestValue => 'Best Value';

  @override
  String get features => 'Features';

  @override
  String get loading => 'Loading...';

  @override
  String get errorOccurred => 'An error occurred';

  @override
  String get retry => 'Retry';

  @override
  String get noPackagesAvailable => 'No packages available';

  @override
  String get noPackagesDescription => 'Please check back later';

  @override
  String get purchaseSuccess => 'Purchase Successful!';

  @override
  String get purchaseSuccessDesc => 'Your subscription is now active';

  @override
  String get purchaseError => 'Purchase Fail!';

  @override
  String get close => 'Close';

  @override
  String get currentPlan => 'Current Plan';

  @override
  String get expiredPlan => 'Expired';

  @override
  String get activeSubscriptions => 'Active Subscriptions';

  @override
  String get expiredSubscriptions => 'Expired Subscriptions';

  @override
  String get noHistory => 'No Purchase History';

  @override
  String get noHistoryDescription => 'You haven\'t made any purchases yet';

  @override
  String get purchaseDate => 'Purchase Date';

  @override
  String get expiryDate => 'Expiry Date';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get orderId => 'Order ID';

  @override
  String get amount => 'Amount';

  @override
  String get status => 'Status';

  @override
  String get active => 'Active';

  @override
  String get expired => 'Expired';

  @override
  String daysRemaining(int days) {
    return '$days days remaining';
  }

  @override
  String get language => 'Language';

  @override
  String get thai => 'ภาษาไทย';

  @override
  String get english => 'English';

  @override
  String get confirmPurchase => 'Confirm Purchase';

  @override
  String confirmPurchaseDesc(String packageName, String price) {
    return 'Are you sure you want to purchase $packageName for $price?';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get creditCard => 'Credit Card';

  @override
  String get applePay => 'Apple Pay';

  @override
  String get googlePay => 'Google Pay';

  @override
  String get promptPay => 'PromptPay';

  @override
  String get unlimited => 'Unlimited';

  @override
  String get gb => 'GB';

  @override
  String get startDate => 'Start Date';

  @override
  String get viewDetails => 'View Details';

  @override
  String get packageDetails => 'Package Details';
}
