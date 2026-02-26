import 'package:ighty_support/routes/routes_page.dart';
import 'package:ighty_support/utils/all_imports.dart';

class ProfileController extends GetxController {
  // Reactive variable for language state (default false = English)
  var isSpanish = false.obs;

  void toggleLanguage() {
    isSpanish.value = !isSpanish.value;
  }

  // Menu items list, each with icon, label and optional action
  void onEditProfile() {
    Get.toNamed(AppRoutes.editProfileScreen);
  }
  void onPolicy() {
    Get.toNamed(AppRoutes.policyScreen);
  }
  void onTerms() {
    Get.toNamed(AppRoutes.termsScreen);
  }
  void onChangePassword() {
    Get.toNamed(AppRoutes.changePasswordScreen);
  }

  void onDeactivateAccount() {}
  void onLogout() {
    Get.back();
  }
}
