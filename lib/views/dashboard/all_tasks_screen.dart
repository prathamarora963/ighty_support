import 'package:ighty_support/controller/dashboard/all_tasks_controller.dart';
import 'package:ighty_support/generated/assets.dart';
import 'package:ighty_support/routes/routes_page.dart';
import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/app_string.dart';

class AllTasksScreen extends GetView<AllTasksController> {
  const AllTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ── Header ────────────────────────────────────────────────────
          _buildHeader(),

          // ── Title Row + Filter Chip ──────────────────────────────────
          Obx(() => _buildTitleRow()),

          const SizedBox(height: 12),

          // ── Task List ─────────────────────────────────────────────────
          Expanded(
            child: Obx(() {
              final tasks = controller.filteredTasks;
              if (tasks.isEmpty) {
                return Center(
                  child: AppText(
                    text: AppString.noDataFound,
                    textSize: 14,
                    color: const Color(0xFFAAAAAA),
                  ),
                );
              }
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                itemCount: tasks.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (_, i) => _TaskCard(task: tasks[i]),
              );
            }),
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
          // Back button
          GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          ),
          const SizedBox(width: 12),
          //   Expanded(
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         AppText(
          //           text: AppString.helloUser,
          //           textSize: 26,
          //           fontWeight: FontWeight.bold,
          //           color: AppColor.blackColor,
          //         ),
          //         const SizedBox(height: 4),
          //         AppText(
          //           text: AppString.tasksForToday,
          //           textSize: 13,
          //           color: const Color(0xFF888888),
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ],
          //     ),
          //   ),
          //   GestureDetector(
          //     onTap: () => Get.toNamed(AppRoutes.profileScreen),
          //     child: Container(
          //       width: 48,
          //       height: 48,
          //       decoration: const BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: Color(0xFFF0F0F0),
          //       ),
          //       child: Image.asset(Assets.iconProfileIcon),
          //     ),
          //   ),
        ],
      ),
    );
  }

  // ── Title + Filter Row ─────────────────────────────────────────────────────
  Widget _buildTitleRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          AppText(
            text: AppString.allTasks,
            textSize: 17,
            fontWeight: FontWeight.w700,
            color: AppColor.blackColor,
          ),
          const Spacer(),
          // Filter dropdown chip
          GestureDetector(
            onTap: _showFilterSheet,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText(
                    text: controller.selectedFilter.value,
                    textSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColor.blackColor,
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.keyboard_arrow_down_rounded, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterSheet() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: AppString.filterByStatus,
              textSize: 16,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 16),
            ...controller.filters.map(
              (f) => ListTile(
                contentPadding: EdgeInsets.zero,
                title: AppText(text: f, textSize: 14),
                trailing: controller.selectedFilter.value == f
                    ? Icon(Icons.check_rounded, color: AppColor.themeColor)
                    : null,
                onTap: () {
                  controller.selectedFilter.value = f;
                  Get.back();
                },
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

// ── Task Card ─────────────────────────────────────────────────────────────────

class _TaskCard extends StatelessWidget {
  final TaskItem task;
  const _TaskCard({required this.task});

  @override
  Widget build(BuildContext context) {
    final isInProgress = task.status == TaskStatus.inProgress;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2E9E3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Site info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: task.siteName,
                  textSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blackColor,
                ),
                const SizedBox(height: 4),
                AppText(
                  text: task.time,
                  textSize: 13,
                  color: const Color(0xFF888888),
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Status button
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.ticketDetailScreen),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: AppColor.blackColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: AppText(
                text: isInProgress
                    ? AppString.inProgress
                    : AppString.viewTicket,
                textSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
