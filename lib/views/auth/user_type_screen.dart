import 'package:ighty_support/generated/assets.dart';
import 'package:ighty_support/routes/routes_page.dart';
import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/app_string.dart';
import 'package:ighty_support/utils/comman_background.dart';
import 'package:ighty_support/utils/db_helper.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommanScaffold(
        child: Column(
          children: [
            SizedBox(height: 100),
            Image.asset(Assets.iconsIghtyAppLogo),
            Spacer(),
            AppText(
              text: AppString.tagLine,
              textAlign: TextAlign.center,
              lineHeight: 1.3,
              textSize: 26,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 37),
            AppButton(
              text: AppString.admin,
              onTap: () {
                DbHelper().saveUserRole(1); // 1 for Admin
                Get.toNamed(AppRoutes.loginScreen);
              },
            ),
            SizedBox(height: 30),
            AppButton(
              text: AppString.technician,
              onTap: () {
                DbHelper().saveUserRole(2); // 2 for Technician
                Get.toNamed(AppRoutes.loginScreen);
              },
              buttonColor: AppColor.blackColor,
            ),
            SizedBox(height: 30),
          ],
        ).paddingSymmetric(horizontal: 20, vertical: 20),
      ),
    );
  }
}
