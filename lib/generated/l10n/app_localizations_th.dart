// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appName => 'T-POP';

  @override
  String get purchasePackage => 'ซื้อแพ็กเกจ';

  @override
  String get purchaseHistory => 'ประวัติการซื้อ';

  @override
  String get selectPackage => 'แพ็กเกจ T-POP Premium';

  @override
  String packageDescription(Object packageCount) {
    return 'แพ็กเกจ T-POP Premium คือแพ็กเกจสมาชิกแบบมีค่าใช้จ่าย โดยแบ่งเป็น $packageCount แพ็กเกจ';
  }

  @override
  String get perYear => '/ ปี';

  @override
  String get perMonth => '/ เดือน';

  @override
  String get buyNow => 'ซื้อเลย';

  @override
  String get mostPopular => 'ยอดนิยม';

  @override
  String get bestValue => 'คุ้มที่สุด';

  @override
  String get features => 'สิ่งที่ได้รับ';

  @override
  String get loading => 'กำลังโหลด...';

  @override
  String get errorOccurred => 'เกิดข้อผิดพลาด';

  @override
  String get retry => 'ลองใหม่';

  @override
  String get noPackagesAvailable => 'ไม่มีแพ็กเกจ';

  @override
  String get noPackagesDescription => 'กรุณาตรวจสอบในภายหลัง';

  @override
  String get purchaseSuccess => 'ซื้อสำเร็จ!';

  @override
  String get purchaseSuccessDesc => 'การสมัครสมาชิกของคุณเปิดใช้งานแล้ว';

  @override
  String get purchaseError => 'ซื้อไม่สำเร็จ';

  @override
  String get close => 'ปิด';

  @override
  String get currentPlan => 'แผนปัจจุบัน';

  @override
  String get expiredPlan => 'หมดอายุ';

  @override
  String get activeSubscriptions => 'การสมัครที่ใช้งานอยู่';

  @override
  String get expiredSubscriptions => 'การสมัครที่หมดอายุแล้ว';

  @override
  String get noHistory => 'ไม่มีประวัติการซื้อ';

  @override
  String get noHistoryDescription => 'คุณยังไม่เคยซื้อแพ็กเกจ';

  @override
  String get purchaseDate => 'วันที่ซื้อ';

  @override
  String get expiryDate => 'วันหมดอายุ';

  @override
  String get paymentMethod => 'ช่องทางชำระเงิน';

  @override
  String get orderId => 'รหัสคำสั่งซื้อ';

  @override
  String get amount => 'จำนวนเงิน';

  @override
  String get status => 'สถานะ';

  @override
  String get active => 'ใช้งานอยู่';

  @override
  String get expired => 'หมดอายุ';

  @override
  String daysRemaining(int days) {
    return 'เหลืออีก $days วัน';
  }

  @override
  String get language => 'ภาษา';

  @override
  String get thai => 'ภาษาไทย';

  @override
  String get english => 'English';

  @override
  String get confirmPurchase => 'ยืนยันการซื้อ';

  @override
  String confirmPurchaseDesc(String packageName, String price) {
    return 'คุณต้องการซื้อ $packageName ในราคา $price ใช่หรือไม่?';
  }

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get confirm => 'ยืนยัน';

  @override
  String get creditCard => 'บัตรเครดิต';

  @override
  String get applePay => 'Apple Pay';

  @override
  String get googlePay => 'Google Pay';

  @override
  String get promptPay => 'พร้อมเพย์';

  @override
  String get unlimited => 'ไม่จำกัด';

  @override
  String get gb => 'GB';

  @override
  String get startDate => 'วันที่เริ่มต้น';

  @override
  String get viewDetails => 'ดูรายละเอียด';

  @override
  String get packageDetails => 'รายละเอียดแพ็กเกจ';
}
