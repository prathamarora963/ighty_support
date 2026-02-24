import 'package:ighty_support/controller/auth/login_controller.dart';
import 'package:ighty_support/controller/auth/signup_controller.dart';
import '../utils/all_imports.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}
