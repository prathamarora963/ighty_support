import 'package:flutter/material.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:ighty_support/bindings/all_bindings.dart';
import 'package:ighty_support/routes/routes_page.dart';
import 'package:ighty_support/views/auth/login_screen.dart';
import 'package:ighty_support/views/auth/signup_screen.dart';
import 'package:ighty_support/views/auth/splash_screen.dart';
import 'package:ighty_support/views/auth/user_type_screen.dart';
import 'package:ighty_support/views/dashboard/all_tasks_screen.dart';
import 'package:ighty_support/views/dashboard/dashboard_screen.dart';
import 'package:ighty_support/views/dashboard/group_chat_screen.dart';
import 'package:ighty_support/views/dashboard/single_chat_screen.dart';
import 'package:ighty_support/views/dashboard/file_upload_screen.dart';
import 'package:ighty_support/views/dashboard/ticket_detail_screen.dart';
import 'package:ighty_support/views/profile/profile_screen.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget widgetScreen;
    Bindings? binding;
    var args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.splashView:
        widgetScreen = SplashScreen();
        binding = LoginBinding();
        break;
      case AppRoutes.userType:
        widgetScreen = UserTypeScreen();
        binding = LoginBinding();
        break;

      case AppRoutes.loginScreen:
        widgetScreen = LoginScreen();
        binding = LoginBinding();
        break;
      case AppRoutes.signupScreen:
        widgetScreen = SignupScreen();
        binding = SignupBinding();
        break;
      case AppRoutes.dashboardScreen:
        widgetScreen = const DashboardScreen();
        binding = DashboardBinding();
        break;
      case AppRoutes.profileScreen:
        widgetScreen = const ProfileScreen();
        binding = ProfileBinding();
        break;
      case AppRoutes.allTasksScreen:
        widgetScreen = const AllTasksScreen();
        binding = AllTasksBinding();
        break;
      case AppRoutes.singleChatScreen:
        widgetScreen = const SingleChatScreen();
        binding = SingleChatBinding();
        break;
      case AppRoutes.groupChatScreen:
        widgetScreen = const GroupChatScreen();
        binding = GroupChatBinding();
        break;
      case AppRoutes.ticketDetailScreen:
        widgetScreen = const TicketDetailScreen();
        binding = TicketDetailBinding();
        break;
      case AppRoutes.fileUploadScreen:
        widgetScreen = const FileUploadScreen();
        binding = FileUploadBinding();
        break;
      default:
        widgetScreen = _errorRoute();
    }
    return GetPageRoute(
      routeName: settings.name,
      page: () => widgetScreen,
      transition: Transition.rightToLeft,
      binding: binding,
      settings: settings,
    );
  }

  static Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('No Such screen found in route generator'),
      ),
    );
  }
}
