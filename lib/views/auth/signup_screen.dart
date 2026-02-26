import 'dart:io';

import 'package:ighty_support/controller/auth/signup_controller.dart';
import 'package:ighty_support/generated/assets.dart';
import 'package:ighty_support/routes/routes_page.dart';
import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/app_string.dart';
import 'package:ighty_support/utils/comman_background.dart';
import 'package:ighty_support/utils/db_helper.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommanScaffold(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              SizedBox(height: 50),
              Image.asset(Assets.iconsIghtyAppLogo, height: 112),
              SizedBox(height: 10),
              AppText(
                text: AppString.welcomeToIghty,
                textSize: 22,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10),
              AppText(text: AppString.letsBridge, color: Color(0xff969AA8)),
              SizedBox(height: 10),
              Obx(
                () => controller.signupDone.value == false
                    ? Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade200),
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
                          spacing: 15,
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: AppColor.whiteColor,
                                    shape: BoxShape.circle,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x33000000),
                                        blurRadius: 7,
                                        spreadRadius: 1,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Obx(
                                    () => ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: controller.imagePath.value != ""
                                          ? Image.file(
                                              File(controller.imagePath.value),
                                              height: 70,
                                              fit: BoxFit.cover,
                                            )
                                          : Icon(
                                              Icons.person,
                                              color: AppColor.blackColor,
                                              size: 26,
                                            ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.cameraHelper.openImagePicker();
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: AppColor.themeColor,
                                    radius: 10,
                                    child: Icon(
                                      Icons.edit,
                                      size: 10,
                                      color: AppColor.whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            AppTextField(
                              title: AppString.name,
                              titleSpacing: 4,
                              hintText: AppString.enterName,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                            ),
                            AppTextField(
                              title: AppString.emailRequired,
                              titleSpacing: 4,
                              keyboardType: TextInputType.emailAddress,
                              hintText: AppString.enterEmail,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                            ),
                            AppTextField(
                              title: AppString.passwordRequired,
                              titleSpacing: 4,
                              keyboardType: TextInputType.visiblePassword,
                              hintText: AppString.enterPassword,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                            ),
                            AppTextField(
                              title: AppString.phoneNumberRequired,
                              titleSpacing: 4,
                              keyboardType: TextInputType.phone,
                              hintText: AppString.enterPhoneNumber,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                            ),
                            AppTextField(
                              title: AppString.addressRequired,
                              titleSpacing: 4,
                              keyboardType: TextInputType.streetAddress,
                              hintText: AppString.enterAddress,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                            ),
                            AppButton(
                              text: AppString.createAnAccount,
                              onTap: () {
                                controller.signupDone.value = true;
                              },
                              isGradient: true,
                              borderRadius: 23,
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: AppColor.blackColor,
                                  fontSize: AppTextSize.textSize14,
                                  fontWeight: AppTextWeight.semiBoldText,
                                  decorationThickness: 1.2,
                                ),
                                children: [
                                  TextSpan(
                                    style: TextStyle(
                                      color: Color(0xff646260),
                                      fontSize: AppTextSize.textSize14,
                                      fontWeight: AppTextWeight.semiBoldText,
                                    ),
                                    text: AppString.alreadyHaveAccount,
                                  ),
                                  TextSpan(
                                    text: AppString.signInLink,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.back();
                                      },
                                    style: TextStyle(
                                      fontSize: AppTextSize.textSize14,
                                      fontWeight: AppTextWeight.semiBoldText,
                                      color: AppColor.themeColor,
                                    ),
                                  ),
                                ],
                              ),
                              maxLines: 3,
                            ).paddingOnly(bottom: 20),
                          ],
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(top: 60),
                        width: Get.width,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(Assets.imagesSignupSucess),
                          ),
                        ),
                        child: Column(
                          children: [
                            Image.asset(Assets.iconSignupSucessIcon),
                            SizedBox(height: 60),
                            AppText(
                              textAlign: TextAlign.center,
                              lineHeight: 1.3,
                              textSize: 19,
                              color: Color(0xff292825),
                              text: AppString.accountActivationMsg,
                            ),
                            SizedBox(height: 40),
                            AppButton(
                              text: AppString.home,
                              onTap: () {
                                Get.offAllNamed(AppRoutes.dashboardScreen);
                              },
                              width: Get.width - 200,
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
}
