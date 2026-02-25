import 'package:ighty_support/utils/all_imports.dart';

enum TaskStatus { inProgress, viewTicket }

class TaskItem {
  final String siteName;
  final String time;
  final TaskStatus status;

  const TaskItem({
    required this.siteName,
    required this.time,
    required this.status,
  });
}

class AllTasksController extends GetxController {
  // Filter: 'All', 'In Progress', 'View Ticket'
  RxString selectedFilter = 'All'.obs;

  // All available filter options as RxList
  RxList<String> filters =
      <String>['All', 'In Progress', 'View Ticket'].obs;

  // Full task list as RxList
  RxList<TaskItem> allTasks = <TaskItem>[
    const TaskItem(
      siteName: 'Site 1',
      time: '10:30 am - ongoing',
      status: TaskStatus.inProgress,
    ),
    const TaskItem(
        siteName: 'Site 2',
        time: '--:-- -- - --:--',
        status: TaskStatus.viewTicket),
    const TaskItem(
        siteName: 'Site 3',
        time: '--:-- -- - --:--',
        status: TaskStatus.viewTicket),
    const TaskItem(
        siteName: 'Site 4',
        time: '--:-- -- - --:--',
        status: TaskStatus.viewTicket),
    const TaskItem(
        siteName: 'Site 5',
        time: '--:-- -- - --:--',
        status: TaskStatus.viewTicket),
    const TaskItem(
        siteName: 'Site 6',
        time: '--:-- -- - --:--',
        status: TaskStatus.viewTicket),
    const TaskItem(
        siteName: 'Site 7',
        time: '--:-- -- - --:--',
        status: TaskStatus.viewTicket),
  ].obs;

  // Derived filtered list — returns a plain List (not Rx); UI uses Obx on
  // selectedFilter + allTasks so it rebuilds when either changes.
  List<TaskItem> get filteredTasks {
    if (selectedFilter.value == 'All') return allTasks.toList();
    if (selectedFilter.value == 'In Progress') {
      return allTasks
          .where((t) => t.status == TaskStatus.inProgress)
          .toList();
    }
    return allTasks
        .where((t) => t.status == TaskStatus.viewTicket)
        .toList();
  }

  void setFilter(String filter) => selectedFilter.value = filter;
}
