import 'package:ighty_support/controller/dashboard/notifications_controller.dart';
import 'package:ighty_support/generated/assets.dart';
import 'package:ighty_support/routes/routes_page.dart';
import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/app_string.dart';

class NotificationsTab extends GetView<NotificationsController> {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ── Header ────────────────────────────────────────────────────
          _buildHeader(),

          // ── Notification List in white card ───────────────────────────
          Expanded(
            child: Obx(() => controller.notifications.isEmpty
                ? _buildEmptyState()
                : _buildList()),
          ),
        ],
      ),
    );
  }

  // ── Header ─────────────────────────────────────────────────────────────────
  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 56, 20, 16),
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

  // ── Notification List ──────────────────────────────────────────────────────
  Widget _buildList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: controller.notifications.length,
          separatorBuilder: (_, __) => const Divider(
            height: 1,
            indent: 16,
            endIndent: 16,
            color: Color(0xFFEEEEEE),
          ),
          itemBuilder: (_, i) => _NotificationTile(
            notification: controller.notifications[i],
          ),
        ),
      ),
    );
  }

  // ── Empty State ────────────────────────────────────────────────────────────
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: 64,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 14),
          AppText(
            text: AppString.noNotificationsFound,
            textSize: 15,
            color: const Color(0xFFAAAAAA),
          ),
        ],
      ),
    );
  }
}

// ── Notification Tile ─────────────────────────────────────────────────────────

class _NotificationTile extends StatelessWidget {
  final AppNotification notification;
  const _NotificationTile({required this.notification});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: notification.title,
                    textSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColor.blackColor,
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    text: notification.message,
                    textSize: 13,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF555555),
                  ),
                  const SizedBox(height: 4),
                  AppText(
                    text: notification.time,
                    textSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF999999),
                  ),
                ],
              ),
            ),
            // Unread blue dot
            if (notification.isUnread)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1565C0),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
