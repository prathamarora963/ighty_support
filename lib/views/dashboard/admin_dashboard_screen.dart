import 'package:ighty_support/controller/dashboard/admin_dashboard_controller.dart';
import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/views/dashboard/admin_ongoing_tasks_screen.dart';
import 'package:ighty_support/views/dashboard/tabs/admin_home_tab.dart';
import 'package:ighty_support/views/dashboard/tabs/admin_ticket_screen.dart';
import 'package:ighty_support/views/dashboard/tabs/chat_tab.dart';
import 'package:ighty_support/views/dashboard/tabs/notifications_tab.dart';

class AdminDashboardScreen extends GetView<AdminDashboardController> {
  const AdminDashboardScreen({super.key});

  static final List<Widget> _tabs = [
    const AdminHomeTab(),
    const AdminOngoingTasksScreen(),
    AdminTicketScreen(),
    const ChatTab(),
    const NotificationsTab(),
  ];

  static const List<_NavItem> _navItems = [
    _NavItem(icon: Icons.home_rounded, label: "Home"),
    _NavItem(icon: Icons.engineering_rounded, label: "Technician"),
    _NavItem(icon: Icons.assignment_rounded, label: "Ticket"),
    _NavItem(icon: Icons.people_rounded, label: "Group"),
    _NavItem(icon: Icons.notifications_rounded, label: "Notifications"),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final currentIndex = controller.currentIndex.value;
      return Scaffold(
        body: IndexedStack(index: currentIndex, children: _tabs),
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
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
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
