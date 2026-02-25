import 'package:ighty_support/controller/dashboard/dashboard_controller.dart';
import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/app_string.dart';
import 'package:ighty_support/views/dashboard/tabs/chat_tab.dart';
import 'package:ighty_support/views/dashboard/tabs/home_tab.dart';
import 'package:ighty_support/views/dashboard/tabs/leave_management_tab.dart';
import 'package:ighty_support/views/dashboard/tabs/notifications_tab.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  static const List<Widget> _tabs = [
    HomeTab(),
    LeaveManagementTab(),
    ChatTab(),
    NotificationsTab(),
  ];

  static const List<_NavItem> _navItems = [
    _NavItem(icon: Icons.home_rounded, label: AppString.navHome),
    _NavItem(icon: Icons.calendar_month_rounded, label: AppString.navLeaveManagement),
    _NavItem(icon: Icons.chat_bubble_rounded, label: AppString.navChat),
    _NavItem(icon: Icons.notifications_rounded, label: AppString.navNotifications),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final currentIndex = controller.currentIndex.value;
      return Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: _tabs,
        ),
        bottomNavigationBar: _AppBottomNavBar(
          currentIndex: currentIndex,
          items: _navItems,
          onTap: controller.changeTab,
        ),
      );
    });
  }
}

// ─── Data model ───────────────────────────────────────────────────────────────

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}

// ─── Custom Bottom Navigation Bar Widget ──────────────────────────────────────

class _AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final List<_NavItem> items;
  final ValueChanged<int> onTap;

  const _AppBottomNavBar({
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFEEEEEE), width: 1)),
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 12,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: List.generate(items.length, (index) {
              return Expanded(
                child: _NavBarItem(
                  item: items[index],
                  isSelected: currentIndex == index,
                  onTap: () => onTap(index),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

// ─── Single Nav Bar Item ───────────────────────────────────────────────────────

class _NavBarItem extends StatelessWidget {
  final _NavItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColor.themeColor : AppColor.greyColor;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: isSelected ? 1.15 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Icon(item.icon, color: color, size: 24),
            ),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
                fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.w400,
                color: color,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
