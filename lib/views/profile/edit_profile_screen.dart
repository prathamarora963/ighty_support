import 'package:ighty_support/controller/profile/edit_profile_controller.dart';
import 'package:ighty_support/utils/all_imports.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileController());

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: commonAppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
          ),
        ),
        isLeading: true,
        title: "Edit Profile",
        textColor: AppColor.themeColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          children: [
            // Avatar Stack
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColor.splashButtonColor,
                    backgroundImage: AssetImage(
                      'assets/icons/profile_icon.png',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: controller.onChangeProfilePicture,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColor.themeColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Form container
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Names Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 12.0,
                          right: 12.0,
                        ),
                        child: Icon(
                          Icons.person,
                          color: AppColor.themeColor,
                          size: 28,
                        ),
                      ),
                      Expanded(
                        child: AppTextField(
                          title: "First name *",
                          titleColor: AppColor.themeColor,
                          controller: controller.firstNameController,
                          borderColor: Colors.transparent,
                          focusBorderColor: Colors.transparent,
                          fillColor: Colors.transparent,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 4,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: AppTextField(
                          title: "Last name *",
                          titleColor: AppColor.themeColor,
                          controller: controller.lastNameController,
                          borderColor: Colors.transparent,
                          focusBorderColor: Colors.transparent,
                          fillColor: Colors.transparent,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  _buildDividerRow(),
                  const SizedBox(height: 20),

                  // Address
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 12.0,
                          right: 12.0,
                        ),
                        child: Icon(
                          Icons.location_on,
                          color: AppColor.themeColor,
                          size: 28,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextField(
                              title: "Address *",
                              titleColor: AppColor.themeColor,
                              controller: controller.addressController,
                              borderColor: Colors.transparent,
                              focusBorderColor: Colors.transparent,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 4,
                              ),
                            ),
                            Divider(
                              color: Colors.grey.shade400,
                              thickness: 1,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Email
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 12.0,
                          right: 12.0,
                        ),
                        child: Icon(
                          Icons.email,
                          color: AppColor.themeColor,
                          size: 28,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextField(
                              title: "Email Id *",
                              titleColor: AppColor.themeColor,
                              controller: controller.emailController,
                              borderColor: Colors.transparent,
                              focusBorderColor: Colors.transparent,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 4,
                              ),
                            ),
                            Divider(
                              color: Colors.grey.shade400,
                              thickness: 1,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Phone
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 12.0,
                          right: 12.0,
                        ),
                        child: Icon(
                          Icons.phone,
                          color: AppColor.themeColor,
                          size: 28,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextField(
                              title: "Phone Number *",
                              titleColor: AppColor.themeColor,
                              controller: controller.phoneController,
                              borderColor: Colors.transparent,
                              focusBorderColor: Colors.transparent,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 4,
                              ),
                            ),
                            Divider(
                              color: Colors.grey.shade400,
                              thickness: 1,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Save Button
            AppButton(
              text: "Save",
              onTap: controller.onSave,
              buttonColor: AppColor.themeColor,
              textColor: Colors.white,
              borderRadius: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDividerRow() {
    return Row(
      children: [
        const SizedBox(width: 40), // Offset for icon spacing
        Expanded(
          child: Divider(color: Colors.grey.shade400, thickness: 1, height: 1),
        ),
        const SizedBox(width: 10), // Gap between fields
        Expanded(
          child: Divider(color: Colors.grey.shade400, thickness: 1, height: 1),
        ),
      ],
    );
  }
}
