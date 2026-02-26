import 'package:get/get.dart';

class LeaveRequestModel {
  int id;
  String name;
  RxString status; // 'pending', 'approved', 'denied'

  LeaveRequestModel({
    required this.id,
    required this.name,
    String status = 'pending',
  }) : status = status.obs;
}

class AdminLeaveManagementController extends GetxController {
  var requests = <LeaveRequestModel>[
    LeaveRequestModel(id: 1, name: "Tech 1"),
    LeaveRequestModel(id: 2, name: "Tech 2"),
    LeaveRequestModel(id: 3, name: "Tech 3"),
    LeaveRequestModel(id: 4, name: "Tech 4"),
    LeaveRequestModel(id: 5, name: "Tech 5"),
    LeaveRequestModel(id: 6, name: "Tech 6"),
    LeaveRequestModel(id: 7, name: "Tech 7"),
    LeaveRequestModel(id: 8, name: "Tech 8"),
  ].obs;

  void approve(int index) {
    requests[index].status.value = 'approved';
  }

  void deny(int index) {
    requests[index].status.value = 'denied';
  }
}
