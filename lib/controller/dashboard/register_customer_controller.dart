import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterCustomerController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final companyNameController = TextEditingController();
  final companyAddressController = TextEditingController();
  final serviceRequiredController = TextEditingController();

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    companyNameController.dispose();
    companyAddressController.dispose();
    serviceRequiredController.dispose();
    super.onClose();
  }

  void submit() {
    // Add logic to save customer
    Get.back();
  }

  void cancel() {
    Get.back();
  }
}
