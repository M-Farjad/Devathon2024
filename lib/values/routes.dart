import 'package:get/get.dart';

class Routes {
  Routes._();
  static const String initial = '/';
  static const String onboard = '/onboard';
  static const String signup = '/signup';
  static const String confirmCode = '/confirmCode';
  static const String signIn = '/signIn';
  static const String main = '/main';
  static const String home = '/home';
  static const String checkInCheckOut = '/checkInCheckOut';
  static const String history = '/history';
  static const String historyDetail = '/historyDetail';
  static const String settings = '/settings';
  static const String resetPassword = '/resetPassword';
  static const String myAccount = '/myAccount';
  static const String findJobs = '/findJobs';
  static const String findJobsList = '/findJobsList';
  static const String shiftDetails = '/shiftDetails';
  static const String shiftsRequiringApproval = '/ShiftsRequiringApproval';
  static const String pendingAdminApproval = '/PendingAdminApproval';
  static const String notification = '/notification';

  // ! Functions
  static getAdminAssginedRoutes() {
    Get.offAllNamed(Routes.main);
    Get.toNamed(shiftsRequiringApproval);
  }
}
