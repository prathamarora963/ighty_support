import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ighty_support/controller/dashboard/register_customer_controller.dart';
import 'package:ighty_support/generated/assets.dart';
import 'package:ighty_support/utils/app_text.dart';

class RegisterCustomerScreen extends GetView<RegisterCustomerController> {
  const RegisterCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFDE8E9), // Light pinkish
              Color(0xFFF6F6F6), // Light grey
              Color(0xFFF6F6F6),
            ],
            stops: [0.0, 0.3, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const AppText(
                          text: "Hello Admin,",
                          textSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        Assets.iconProfileIcon,
                        fit: BoxFit.cover,
                        errorBuilder: (ctx, err, st) =>
                            const Icon(Icons.account_circle, size: 40),
                      ),
                    ),
                  ],
                ),
              ),

              // Form Container
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: AppText(
                          text: "Register Customer Details",
                          textSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFA1081A),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInputField(
                                "First Name",
                                controller.firstNameController,
                              ),
                              const SizedBox(height: 15),
                              _buildInputField(
                                "Last Name",
                                controller.lastNameController,
                              ),
                              const SizedBox(height: 15),
                              _buildInputField(
                                "Email Address",
                                controller.emailController,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: 15),
                              _buildInputField(
                                "Phone Number",
                                controller.phoneController,
                                keyboardType: TextInputType.phone,
                              ),
                              const SizedBox(height: 15),
                              _buildInputField(
                                "Company Name",
                                controller.companyNameController,
                              ),
                              const SizedBox(height: 15),
                              _buildInputField(
                                "Company Address",
                                controller.companyAddressController,
                              ),
                              const SizedBox(height: 15),
                              _buildInputField(
                                "Service Required",
                                controller.serviceRequiredController,
                              ),
                              const SizedBox(height: 30),

                              // Buttons
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: controller.submit,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFA1081A),
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: const AppText(
                                          text: "Submit",
                                          color: Colors.white,
                                          textSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: controller.cancel,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: const Color(0xFFA1081A),
                                            width: 1.5,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: const AppText(
                                          text: "Cancel",
                                          color: Color(0xFFA1081A),
                                          textSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    TextEditingController textController, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text: label, textSize: 12, color: Colors.grey.shade600),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: textController,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Color(0xFFA1081A)),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
