import 'package:ighty_support/controller/profile/profile_controller.dart';
import 'package:ighty_support/generated/assets.dart';
import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/app_string.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: Column(
        children: [
          // ── Premium Header ─────────────────────────────────────────────
          _buildPremiumHeader(),

          // ── Scrollable Menu ────────────────────────────────────────────
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              physics: const BouncingScrollPhysics(),
              children: [
                // ── Account Info Section ──────────────────────────────────
                _buildInfoSection(),
                const SizedBox(height: 16),

                // ── Settings Groups ───────────────────────────────────────
                _buildSectionHeader(AppString.myAccount),
                _buildMenuCard([
                  _MenuItemData(
                    icon: Icons.manage_accounts_outlined,
                    label: AppString.editProfileDetails,
                    onTap: controller.onEditProfile,
                  ),
                  _MenuItemData(
                    icon: Icons.lock_reset_outlined,
                    label: AppString.changePassword,
                    onTap: controller.onChangePassword,
                  ),
                ]),
                const SizedBox(height: 16),

                _buildSectionHeader('Preferences'),
                _buildMenuCard([
                  _MenuItemData(
                    isWidget: true,
                    widget: _LanguageItem(),
                  ),
                ]),
                const SizedBox(height: 16),

                _buildSectionHeader('About App'),
                _buildMenuCard([
                  _MenuItemData(
                    icon: Icons.policy_outlined,
                    label: AppString.policy,
                    onTap: controller.onPolicy,
                  ),
                  _MenuItemData(
                    icon: Icons.description_outlined,
                    label: AppString.terms,
                    onTap: controller.onTerms,
                  ),
                ]),
                const SizedBox(height: 16),

                _buildSectionHeader('Account Actions'),
                _buildMenuCard([
                  _MenuItemData(
                    icon: Icons.person_remove_outlined,
                    label: AppString.deactivateAccount,
                    color: Colors.redAccent,
                    onTap: controller.onDeactivateAccount,
                  ),
                  _MenuItemData(
                    icon: Icons.logout_rounded,
                    label: AppString.logout,
                    color: Colors.red,
                    onTap: controller.onLogout,
                  ),
                ]),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 56, 16, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0D47A1),
            Color(0xFF1976D2),
            Color(0xFF42A5F5),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconBtn(
                icon: Icons.arrow_back_rounded,
                onTap: () => Get.back(),
              ),
              const AppText(
                text: 'Profile',
                textSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              const SizedBox(width: 40), // Balance
            ],
          ),
          const SizedBox(height: 24),
          // Profile Avatar
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.white24,
              shape: BoxShape.circle,
            ),
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const ImageView.circle(
                image: '', // Placeholder or actual URL
                placeholder: Assets.iconProfileIcon,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Column(
      children: [
        const SizedBox(height: 8),
        const AppText(
          text: AppString.technicianName,
          textSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColor.blackColor,
        ),
        const SizedBox(height: 4),
        AppText(
          text: 'technician@ichtysupport.com',
          textSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black.withOpacity(0.5),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 0, 8),
      child: AppText(
        text: title.toUpperCase(),
        textSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
        color: Colors.black.withOpacity(0.4),
      ),
    );
  }

  Widget _buildMenuCard(List<_MenuItemData> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (_, __) => Divider(
          height: 1,
          color: Colors.grey.withOpacity(0.1),
          indent: 56,
        ),
        itemBuilder: (_, i) => _buildMenuItem(items[i]),
      ),
    );
  }

  Widget _buildMenuItem(_MenuItemData item) {
    if (item.isWidget) return item.widget!;

    return ListTile(
      onTap: item.onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: (item.color ?? AppColor.themeColor).withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          item.icon,
          size: 20,
          color: item.color ?? AppColor.themeColor,
        ),
      ),
      title: AppText(
        text: item.label!,
        textSize: 15,
        fontWeight: FontWeight.w500,
        color: item.color ?? AppColor.blackColor,
      ),
      trailing: Icon(
        Icons.chevron_right_rounded,
        size: 20,
        color: Colors.black.withOpacity(0.2),
      ),
    );
  }

  Widget _buildIconBtn({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
    );
  }
}

class _MenuItemData {
  final IconData? icon;
  final String? label;
  final VoidCallback? onTap;
  final Color? color;
  final bool isWidget;
  final Widget? widget;

  _MenuItemData({
    this.icon,
    this.label,
    this.onTap,
    this.color,
    this.isWidget = false,
    this.widget,
  });
}

// ── Language Toggle Item ──────────────────────────────────────────────────────

class _LanguageItem extends StatefulWidget {
  @override
  State<_LanguageItem> createState() => _LanguageItemState();
}

class _LanguageItemState extends State<_LanguageItem> {
  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // UK flag circle
          ImageView.circle(
            image: 'https://flagcdn.com/w80/gb.png',
            fit: BoxFit.cover,
            width: 38,
            height: 38,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: AppText(
              text: AppString.english,
              textSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColor.blackColor,
            ),
          ),
          Switch(
            value: isEnglish,
            onChanged: (val) => setState(() => isEnglish = val),
            activeColor: AppColor.themeColor,
          ),
        ],
      ),
    );
  }
}
