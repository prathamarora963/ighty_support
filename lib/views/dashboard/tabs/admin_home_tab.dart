import 'package:ighty_support/controller/dashboard/admin_dashboard_controller.dart';
import 'package:ighty_support/generated/assets.dart';
import 'package:ighty_support/routes/routes_page.dart';
import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/comman_background.dart';
import 'package:table_calendar/table_calendar.dart';

class AdminHomeTab extends GetView<AdminDashboardController> {
  const AdminHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CommanScaffold(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppText(
                  text: 'Hello Admin,',
                  textSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColor.blackColor,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.profileScreen),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      Assets.iconProfileIcon,
                      fit: BoxFit.cover,
                      errorBuilder: (ctx, err, st) =>
                          const Icon(Icons.account_circle, size: 40),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // Title
            const AppText(
              text: 'Dashboard',
              textSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFA1081A), // Dark Red
            ),
            const SizedBox(height: 20),

            // Summary Cards Grid
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.activeTechScreen);
                    },
                    child: _buildSummaryCard(
                      title: "Active Techs",
                      value: "12",
                      iconData: Icons.engineering_rounded,
                      gradientColors: [Color(0xFFFFA270), Color(0xFFFF6A74)],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.adminOngoingTasksScreen);
                    },
                    child: _buildSummaryCard(
                      title: "Ongoing Tasks",
                      value: "120",
                      iconData: Icons.assignment_rounded,
                      gradientColors: [Color(0xFFFFD464), Color(0xFFFF7E8B)],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.allCustomersScreen);
                    },
                    child: _buildSummaryCard(
                      title: "Active\nCustomers",
                      value: "2730",
                      iconData: Icons.group_rounded,
                      gradientColors: [Color(0xFFFFA270), Color(0xFFFF6A74)],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.adminLeaveManagementScreen);
                    },
                    child: _buildSummaryCard(
                      title: "Upcoming Employee\nLeaves",
                      value: "30",
                      iconData: Icons.calendar_month_rounded,
                      gradientColors: [Color(0xFFFF8B80), Color(0xFFFF5D67)],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // Leave Management Section
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    text: "Leave management",
                    textSize: 14,
                    color: AppColor.darkGrey,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 15),

                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFF7941D), Color(0xFFF9C349)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 8,
                    ),
                    child: Obx(
                      () => TableCalendar(
                        firstDay: DateTime.utc(2020, 1, 1),
                        lastDay: DateTime.utc(2030, 12, 31),
                        focusedDay: controller.focusedDay.value,
                        selectedDayPredicate: (day) =>
                            isSameDay(controller.selectedDay.value, day),
                        onDaySelected: controller.onDaySelected,
                        onPageChanged: controller.onPageChanged,
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          leftChevronIcon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                          rightChevronIcon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                          titleTextStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                          weekendStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        calendarStyle: CalendarStyle(
                          defaultTextStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          weekendTextStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          outsideTextStyle: const TextStyle(
                            color: Colors.white30,
                            fontSize: 14,
                          ),
                          todayDecoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          selectedDecoration: const BoxDecoration(
                            color: Color(0xFFA1081A),
                            shape: BoxShape.circle,
                          ),
                        ),
                        calendarBuilders: CalendarBuilders(
                          defaultBuilder: (context, day, focusedDay) {
                            for (DateTime d in controller.highlightedDates) {
                              if (isSameDay(d, day)) {
                                return Container(
                                  margin: const EdgeInsets.all(6.0),
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFA1081A),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    day.day.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              }
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Leave Requests
                  _buildLeaveRequestItem("Tech 1"),
                  const SizedBox(height: 15),
                  _buildLeaveRequestItem("Tech 2"),
                  const SizedBox(height: 15),

                  // See all
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: const AppText(
                        text: "See all.....",
                        color: AppColor.greyColor,
                        textSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Technician Login Approval Section
                  const AppText(
                    text: "Technician Login Approval",
                    textSize: 14,
                    color: AppColor.darkGrey,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 15),
                  _buildLoginApprovalItem("Tech 1"),
                  const SizedBox(height: 15),
                  _buildLoginApprovalItem("Tech 2"),
                  const SizedBox(height: 15),

                  // See all for login approvals
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: const AppText(
                        text: "See all.....",
                        color: AppColor.greyColor,
                        textSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required IconData iconData,
    required List<Color> gradientColors,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: title,
                  textSize: 12,
                  color: AppColor.greyColor,
                  lineHeight: 1.2,
                ),
                const SizedBox(height: 6),
                AppText(
                  text: value,
                  textSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(iconData, color: Colors.white, size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaveRequestItem(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFFFFA270), Color(0xFFFF6A74)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.engineering_rounded,
              color: Colors.white,
              size: 22,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: AppText(
              text: "$name Applied for an Leave",
              textSize: 12,
              color: const Color(0xFFA1081A),
              fontWeight: FontWeight.w500,
            ),
          ),
          // Approve Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFA1081A),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const AppText(
              text: "Approve",
              color: Colors.white,
              textSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          // Deny Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: AppText(
              text: "Deny",
              color: Colors.red.shade900,
              textSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginApprovalItem(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFFFFA270), Color(0xFFFF6A74)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.engineering_rounded,
              color: Colors.white,
              size: 22,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: AppText(
              text: "$name Login",
              textSize: 12,
              color: const Color(0xFFA1081A),
              fontWeight: FontWeight.w500,
            ),
          ),
          // Approve Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFA1081A),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const AppText(
              text: "Approve",
              color: Colors.white,
              textSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          // Deny Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: AppText(
              text: "Deny",
              color: Colors.red.shade900,
              textSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          // Generate Password Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFA1081A),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: "Generate",
                  color: Colors.white,
                  textSize: 10,
                  fontWeight: FontWeight.w500,
                  lineHeight: 1.1,
                ),
                AppText(
                  text: "Password",
                  color: Colors.white,
                  textSize: 10,
                  fontWeight: FontWeight.w500,
                  lineHeight: 1.1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
