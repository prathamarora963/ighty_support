import 'package:ighty_support/utils/all_imports.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
