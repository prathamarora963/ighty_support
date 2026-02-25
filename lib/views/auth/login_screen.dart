import 'package:ighty_support/controller/auth/login_controller.dart';
import 'package:ighty_support/generated/assets.dart';
import 'package:ighty_support/routes/routes_page.dart';
import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/app_string.dart';
import 'package:ighty_support/utils/comman_background.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommanScaffold(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              SizedBox(height: 100),
              Image.asset(Assets.iconsIghtyAppLogo),
              SizedBox(height: 11),
              AppText(
                text: AppString.letsBridge,
                textSize: 14,
                color: Color(0xff969AA8),
              ),
              SizedBox(height: 47),
              AppTextField(
                title: AppString.email,
                hintText: AppString.enterEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30),
              Obx(
                () => AppTextField(
                  title: AppString.password,
                  hintText: AppString.enterPassword,
                  obscureText: controller.isObscure.value,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.isObscure.value = !controller.isObscure.value;
                    },
                    child: Icon(
                      controller.isObscure.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 37),
              Row(
                children: [
                  Spacer(),
                  AppText(
                    text: AppString.forgotPassword,
                    underline: true,
                    underlineColor: AppColor.themeColor,
                    color: AppColor.themeColor,
                  ),
                ],
              ),
              SizedBox(height: 34),
              AppButton(
                text: AppString.signIn,
                onTap: () {
                  Get.offAllNamed(AppRoutes.dashboardScreen);
                },
                borderRadius: 23,
                isGradient: true,
              ),
              SizedBox(height: 19),
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
                      text: AppString.dontHave,
                    ),
                    TextSpan(
                      text: AppString.signUp,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(AppRoutes.signupScreen);
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
        ),
      ),
    );
  }
}
