import 'package:get/get.dart';

class AdminDashboardController extends GetxController {
  var currentIndex = 0.obs;

  // Calendar State
  var focusedDay = DateTime.now().obs;
  var selectedDay = Rx<DateTime?>(null);

  final List<DateTime> highlightedDates = [
    DateTime.now().add(const Duration(days: 2)),
    DateTime.now().add(const Duration(days: 5)),
  ];

  void changeTab(int index) {
    currentIndex.value = index;
  }

  void onDaySelected(DateTime selected, DateTime focused) {
    selectedDay.value = selected;
    focusedDay.value = focused;
  }

  void onPageChanged(DateTime focused) {
    focusedDay.value = focused;
  }
}
