import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/date_time_picker.dart';
import 'package:intl/intl.dart';

class LeaveManagementController extends GetxController {
  // ── Leave Type ─────────────────────────────────────────────────────────────
  RxString selectedLeaveType = 'Maternity Leave'.obs;

  // Reactive leave type list
  RxList<String> leaveTypes = <String>[
    'Maternity Leave',
    'Sick Leave',
    'Casual Leave',
    'Earned Leave',
    'Paternity Leave',
    'Emergency Leave',
  ].obs;

  // ── Dates ──────────────────────────────────────────────────────────────────
  RxString startDate = ''.obs;
  RxString endDate = ''.obs;

  @override
  void onInit() {
    final now = DateTime.now();
    final formatted = DateFormat('dd, MMM, yyyy').format(now);
    startDate.value = formatted;
    endDate.value = formatted;
    super.onInit();
  }

  Future<void> pickStartDate() async {
    final now = DateTime.now();
    final result = await DateTimePicker.selectDate(
      dateFormat: 'dd, MMM, yyyy',
      initialDate: now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 2),
    );
    if (result.isNotEmpty) startDate.value = result;
  }

  Future<void> pickEndDate() async {
    final now = DateTime.now();
    final result = await DateTimePicker.selectDate(
      dateFormat: 'dd, MMM, yyyy',
      initialDate: now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 2),
    );
    if (result.isNotEmpty) endDate.value = result;
  }

  // ── Reason ─────────────────────────────────────────────────────────────────
  final TextEditingController reasonController = TextEditingController();
  RxString reasonText = ''.obs;

  // ── Half Day ───────────────────────────────────────────────────────────────
  RxBool isHalfDay = true.obs;

  void toggleHalfDay(bool? value) {
    isHalfDay.value = value ?? false;
  }

  // ── Form validity ──────────────────────────────────────────────────────────
  bool get isFormValid =>
      selectedLeaveType.value.isNotEmpty &&
      startDate.value.isNotEmpty &&
      endDate.value.isNotEmpty;

  // ── Actions ────────────────────────────────────────────────────────────────
  void onApply() {
    // TODO: call API
  }

  void onCancel() {
    reasonController.clear();
    reasonText.value = '';
    final now = DateTime.now();
    final formatted = DateFormat('dd, MMM, yyyy').format(now);
    startDate.value = formatted;
    endDate.value = formatted;
    isHalfDay.value = false;
    selectedLeaveType.value = 'Maternity Leave';
  }

  @override
  void onClose() {
    reasonController.dispose();
    super.onClose();
  }
}
