import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/camera_Helper.dart';

class SignupController extends GetxController
    implements CameraOnCompleteListener {
  late CameraHelper cameraHelper;
  RxString imagePath = "".obs;
  RxBool signupDone = false.obs;
  @override
  void onInit() {
    cameraHelper = CameraHelper(this);
    super.onInit();
  }

  @override
  void onSuccessFile(String file, String fileType) {
    imagePath.value = file;
  }
}
