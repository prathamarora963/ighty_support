import 'package:ighty_support/controller/auth/login_controller.dart';
import 'package:ighty_support/controller/auth/signup_controller.dart';
import 'package:ighty_support/controller/dashboard/all_tasks_controller.dart';
import 'package:ighty_support/controller/dashboard/chat_controller.dart';
import 'package:ighty_support/controller/dashboard/dashboard_controller.dart';
import 'package:ighty_support/controller/dashboard/group_chat_controller.dart';
import 'package:ighty_support/controller/dashboard/leave_management_controller.dart';
import 'package:ighty_support/controller/dashboard/notifications_controller.dart';
import 'package:ighty_support/controller/dashboard/single_chat_controller.dart';
import 'package:ighty_support/controller/dashboard/ticket_detail_controller.dart';
import 'package:ighty_support/controller/dashboard/file_upload_controller.dart';
import 'package:ighty_support/controller/profile/profile_controller.dart';
import '../utils/all_imports.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => LeaveManagementController());
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => NotificationsController());
  }
}

class AllTasksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllTasksController());
  }
}

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}

class SingleChatBinding extends Bindings {
  @override
  void dependencies() {
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    Get.lazyPut(() => SingleChatController(
          contactName: args['name'] ?? '',
          contactSubtitle: args['subtitle'] ?? '',
          contactAvatar: args['avatar'] ?? '',
          contactOnline: args['online'] ?? false,
        ));
  }
}

class GroupChatBinding extends Bindings {
  @override
  void dependencies() {
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    Get.lazyPut(() => GroupChatController(
          groupName: args['groupName'] ?? '',
          membersPreview: args['membersPreview'] ?? '',
          memberAvatars: List<String>.from(args['memberAvatars'] ?? []),
        ));
  }
}

class TicketDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TicketDetailController());
  }
}

class FileUploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FileUploadController());
  }
}
