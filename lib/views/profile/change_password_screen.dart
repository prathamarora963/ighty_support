import 'package:ighty_support/controller/profile/change_password_controller.dart';
import 'package:ighty_support/utils/all_imports.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePasswordController());

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
        title: "Reset Password",
        textColor: AppColor.themeColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current Password
            Obx(
              () => AppTextField(
                title: "Current Password",
                titleColor: AppColor.darkGrey,
                controller: controller.currentPasswordController,
                obscureText: !controller.isCurrentPasswordVisible.value,
                hintText: "********",
                hintTextColor: AppColor.themeColor,
                hintSize: 22,
                hintWeight: FontWeight.bold,
                // The design shows the input looking completely flat/borderless with a single bottom line
                // since AppTextField from this project uses OutlineInputBorder by default,
                // we customize the borders to match the design (bottom line only).
                // Unfortunately AppTextField doesn't expose `focusedBorder` natively for UnderlineInputBorder easily without tweaking the widget
                // Wait, looking at AppTextField, it only allows OutlineInputBorder in its code.
                // For a bottom border only, we must set border colors to transparent except bottom, OR wrap in Container.
                // Since AppTextField is requested, we will use it with its properties.
                // I will adjust colors to match.
                borderColor: Colors.transparent,
                focusBorderColor: Colors.transparent,
                fillColor: Colors.transparent,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 8,
                ),
                suffixIcon: GestureDetector(
                  onTap: controller.toggleCurrentPasswordVisibility,
                  child: Icon(
                    controller.isCurrentPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey.shade400, thickness: 1, height: 1),
            const SizedBox(height: 30),

            // New Password
            Obx(
              () => AppTextField(
                title: "New Password",
                titleColor: AppColor.darkGrey,
                controller: controller.newPasswordController,
                obscureText: !controller.isNewPasswordVisible.value,
                hintText: "********",
                hintTextColor: AppColor.themeColor,
                hintSize: 22,
                hintWeight: FontWeight.bold,
                borderColor: Colors.transparent,
                focusBorderColor: Colors.transparent,
                fillColor: Colors.transparent,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 8,
                ),
                suffixIcon: GestureDetector(
                  onTap: controller.toggleNewPasswordVisibility,
                  child: Icon(
                    controller.isNewPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey.shade400, thickness: 1, height: 1),
            const SizedBox(height: 30),

            // Confirm New Password
            Obx(
              () => AppTextField(
                title: "Confirm New Password",
                titleColor: AppColor.darkGrey,
                controller: controller.confirmPasswordController,
                obscureText: !controller.isConfirmPasswordVisible.value,
                hintText: "********",
                hintTextColor: AppColor.themeColor,
                hintSize: 22,
                hintWeight: FontWeight.bold,
                borderColor: Colors.transparent,
                focusBorderColor: Colors.transparent,
                fillColor: Colors.transparent,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 8,
                ),
                suffixIcon: GestureDetector(
                  onTap: controller.toggleConfirmPasswordVisibility,
                  child: Icon(
                    controller.isConfirmPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Divider(color: Colors.grey.shade400, thickness: 1, height: 1),

            const SizedBox(height: 60),

            // Update Password Button
            AppButton(
              text: "Update Password",
              onTap: controller.onUpdatePassword,
              buttonColor: AppColor.themeColor,
              textColor: Colors.white,
              borderRadius: 8,
            ),
          ],
        ),
      ),
    );
  }
}
