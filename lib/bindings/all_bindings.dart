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
import 'package:ighty_support/controller/profile/change_password_controller.dart';
import 'package:ighty_support/controller/profile/edit_profile_controller.dart';
import 'package:ighty_support/controller/dashboard/admin_dashboard_controller.dart';
import 'package:ighty_support/controller/dashboard/active_tech_controller.dart';
import 'package:ighty_support/controller/dashboard/all_customers_controller.dart';
import 'package:ighty_support/controller/dashboard/register_customer_controller.dart';
import 'package:ighty_support/controller/dashboard/admin_leave_management_controller.dart';
import 'package:ighty_support/controller/dashboard/admin_ongoing_tasks_controller.dart';
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

class AdminDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminDashboardController());
    Get.lazyPut(() => AdminOngoingTasksController());
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

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }
}

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileController());
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

class ActiveTechBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActiveTechController());
  }
}

class AllCustomersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllCustomersController());
  }
}

class RegisterCustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterCustomerController());
  }
}

class AdminLeaveManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminLeaveManagementController());
  }
}

class AdminOngoingTasksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminOngoingTasksController());
  }
}
