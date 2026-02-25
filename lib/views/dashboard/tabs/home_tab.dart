import 'package:ighty_support/generated/assets.dart';
import 'package:ighty_support/routes/routes_page.dart';
import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/app_string.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  static const List<Map<String, String>> _tasks = [
    {'site': 'Site 1', 'time': '10:30 am - ongoing'},
    {'site': 'Site 2', 'time': '--:-- -- - --:--'},
    {'site': 'Site 3', 'time': '--:-- -- - --:--'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildSectionHeader(),
                  const SizedBox(height: 12),
                  ..._tasks.map(
                    (task) =>
                        _TaskCard(site: task['site']!, time: task['time']!),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          _buildActionPanel(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: AppString.helloUser,
                  textSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColor.blackColor,
                ),
                const SizedBox(height: 4),
                AppText(
                  text: AppString.tasksForToday,
                  textSize: 13,
                  color: const Color(0xFF888888),
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.profileScreen),
            child: Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF0F0F0),
              ),
              child: Image.asset(Assets.iconProfileIcon),
            ),
          ),
        ],
      ),
    );
  }

  // ── Section Header (Today's Tasks + See All) ──────────────────────────────
  Widget _buildSectionHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: AppString.todaysTasks,
            textSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColor.themeColor,
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.allTasksScreen),
            child: AppText(
              text: AppString.seeAll,
              textSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColor.themeColor,
            ),
          ),
        ],
      ),
    );
  }

  // ── Bottom Action Panel ───────────────────────────────────────────────────
  Widget _buildActionPanel() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      decoration: const BoxDecoration(
        color: Color(0xFFF5EAEA),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Check-out Office (light button)
          Container(
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(
                    0.1,
                  ), // Adjusted opacity for a subtle look
                  blurRadius: 6, // From your "Blur 6dp"
                  offset: const Offset(0, 3), // From your "X 0dp, Y 3dp"
                  spreadRadius: 0,
                ),
              ],
            ),
            child: AppButton(
              text: AppString.checkoutOffice,
              onTap: () {},
              borderRadius: 30,
              height: 52,
              buttonColor: Colors.transparent,
              textColor: AppColor.themeColor,
            ),
          ),
          const SizedBox(height: 14),
          // Start Project (dark red)
          AppButton(
            text: AppString.startProject,
            onTap: () {},
            borderRadius: 30,
            height: 52,
            isGradient: true,
          ),
          const SizedBox(height: 14),
          AppButton(
            text: AppString.breakIn,
            onTap: () {},
            borderRadius: 30,
            height: 52,
            isGradient: true,
          ),
        ],
      ),
    );
  }
}

// ── Task Card Widget ──────────────────────────────────────────────────────────

class _TaskCard extends StatelessWidget {
  final String site;
  final String time;

  const _TaskCard({required this.site, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2E9E3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: site,
                  textSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColor.blackColor,
                ),
                const SizedBox(height: 4),
                AppText(
                  text: time,
                  textSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF888888),
                ),
              ],
            ),
          ),
          // View Ticket Button
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.ticketDetailScreen),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppColor.blackColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: AppText(
                text: AppString.viewTicket,
                textSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColor.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
