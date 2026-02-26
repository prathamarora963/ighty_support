import 'package:ighty_support/controller/profile/profile_controller.dart';
import 'package:ighty_support/utils/all_imports.dart';
import 'package:flutter/cupertino.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // A placeholder flag text or asset could be used
    const String ukFlag = '🇬🇧';

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
        title: "My Account",
        textColor: AppColor.themeColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with Cover Image and Avatar
            SizedBox(
              height: 240,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // Cover Image
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0075C4), // Fallback blue
                      // If you have the specific asset, it would go here.
                      // image: DecorationImage(image: AssetImage('assets/images/background_image.png'), fit: BoxFit.cover),
                    ),
                    child: Image.asset(
                      'assets/images/background_image.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Container(color: const Color(0xFF0075C4)),
                    ),
                  ),
                  // Avatar Profile Picture
                  Positioned(
                    top: 130, // 180 - 50
                    child: Container(
                      padding: const EdgeInsets.all(4), // White border effect
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 46,
                        backgroundColor: AppColor.splashButtonColor,
                        backgroundImage: AssetImage('assets/icons/profile_icon.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Name
            const AppText(
              text: "Technician 1",
              textSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColor.blackColor,
            ),
            const SizedBox(height: 8),

            // View Profile Button
            GestureDetector(
              onTap: controller.onEditProfile,
              child: const AppText(
                text: "View profile",
                textSize: 16,
                color: AppColor.themeColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            
            // Divider top
            Divider(color: Colors.grey.shade300, height: 1, thickness: 1),

            // Menu Items
            _buildMenuItem(
              title: "Edit Profile Details",
              iconData: Icons.edit_outlined,
              onTap: controller.onEditProfile,
            ),
            _buildMenuItem(
              title: "Policy",
              iconData: Icons.policy_outlined,
              onTap: controller.onPolicy,
            ),
            _buildMenuItem(
              title: "Terms",
              iconData: Icons.description_outlined,
              onTap: controller.onTerms,
            ),
            
            // Language Item with Switch
            Obx(() => InkWell(
              onTap: () {
                controller.toggleLanguage(); 
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  children: [
                    // Custom Animated Toggle for Language
                    Container(
                      width: 60,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                          BoxShadow(
                             color: Colors.black.withOpacity(0.05),
                             spreadRadius: 2,
                             blurRadius: 8,
                           ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            left: controller.isSpanish.value ? 30 : 2, // If Spanish, move right. If English, move left.
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: controller.isSpanish.value 
                                ? BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xFFE5A630), // Spain flag yellow
                                    border: Border.all(color: Colors.red.shade700, width: 3),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: const Offset(-1, 0),
                                      )
                                    ]
                                  )
                                : BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent, // UK Flag colors or styling would go here. We'll use a white circle with blue/red border for now
                                    border: Border.all(color: Colors.blue.shade800, width: 2),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: const Offset(1, 0),
                                      )
                                    ]
                                  ),
                              alignment: Alignment.center,
                              child: Text(
                                controller.isSpanish.value ? "" : "🇬🇧",
                                style: const TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    AppText(
                      text: controller.isSpanish.value ? "Spanish" : "English",
                      textSize: 16,
                      color: AppColor.darkGrey,
                    ),
                  ],
                ),
              ),
            )),
            Divider(color: Colors.grey.shade300, height: 1, thickness: 1),

            _buildMenuItem(
              title: "Change Password",
              iconData: Icons.lock_outline,
              onTap: controller.onChangePassword,
            ),
            _buildMenuItem(
              title: "DeActivate Account",
              iconData: Icons.person_remove_outlined,
              onTap: controller.onDeactivateAccount,
            ),
            _buildMenuItem(
              title: "LogOut",
              iconData: Icons.logout,
              onTap: controller.onLogout,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String title,
    required IconData iconData,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade400, width: 1.5),
                  ),
                  child: Icon(iconData, color: Colors.grey.shade700, size: 22),
                ),
                const SizedBox(width: 15),
                AppText(
                  text: title,
                  textSize: 16,
                  color: AppColor.darkGrey,
                ),
              ],
            ),
          ),
        ),
        Divider(color: Colors.grey.shade300, height: 1, thickness: 1),
      ],
    );
  }
}
