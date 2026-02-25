import 'package:ighty_support/utils/all_imports.dart';

class AppNotification {
  final String title;
  final String message;
  final String time;
  final bool isUnread;

  const AppNotification({
    required this.title,
    required this.message,
    required this.time,
    this.isUnread = false,
  });
}

class NotificationsController extends GetxController {
  final RxList<AppNotification> notifications = <AppNotification>[
    const AppNotification(
      title: 'Test Test',
      message: 'Testing Message',
      time: '1 minute ago',
      isUnread: true,
    ),
    const AppNotification(
      title: 'Test Test',
      message: 'Testing Message',
      time: '1 minute ago',
    ),
    const AppNotification(
      title: 'Test Test',
      message: 'Testing Message',
      time: '2 minutes ago',
    ),
    const AppNotification(
      title: 'Test Test',
      message: 'Testing Message',
      time: '3 minutes ago',
    ),
    const AppNotification(
      title: 'Test Test',
      message: 'Testing Message',
      time: '4 minutes ago',
    ),
    const AppNotification(
      title: 'Test Test',
      message: 'Testing Message',
      time: '5 minutes ago',
    ),
    const AppNotification(
      title: 'Test Test',
      message: 'Testing Message',
      time: '10 minutes ago',
    ),
    const AppNotification(
      title: 'Test Test',
      message: 'Testing Message',
      time: '15 minutes ago',
    ),
  ].obs;
}
