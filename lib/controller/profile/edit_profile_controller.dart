import 'package:ighty_support/utils/all_imports.dart';

class EditProfileController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  void onSave() {
    // Add logic to save the updated profile here
    Get.back();
  }

  void onChangeProfilePicture() {
    // Logic to pick a new profile image
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
