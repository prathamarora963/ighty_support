import 'dart:async';
import 'package:ighty_support/utils/all_imports.dart';

class TicketMaterial {
  final String name;
  final String quantity;
  final bool isIssued;

  const TicketMaterial({
    required this.name,
    required this.quantity,
    required this.isIssued,
  });
}

class TicketDetailController extends GetxController {
  // Timer (counts up like a stopwatch)
  RxString timerDisplay = '00:00:00'.obs;
  RxInt _seconds = 0.obs;
  Timer? _timer;

  // ── Ticket fields (will come from API args later) ──────────────────────────
  RxString ticketTitle = 'CCTV installation Dallas hospital'.obs;
  RxString referenceNumber = 'Ighty22899/8-6-25 199'.obs;
  RxString siteName = 'Dallas hospital'.obs;
  RxString siteAddress = '123, st.peters, zone, Dallas.'.obs;
  RxString address =
      'Molly, House. 2426 Pine Street, Dallas, TX. Y. TEXAS Dallas Dallas.'.obs;
  RxString description =
      'Need to install CCTV in 10 points with HD view based on Cloud Server'
          .obs;
  RxString assignedDate = '08/07/25'.obs;
  RxString assignedTime = '02:06:56 am'.obs;
  RxString expectedDate = '08/09/25'.obs;
  RxString expectedTime = '02:06:56 am'.obs;
  RxString priorityLevel = 'High'.obs;
  RxString status = 'Pending'.obs;

  // ── Materials list ─────────────────────────────────────────────────────────
  RxList<TicketMaterial> materials = <TicketMaterial>[
    const TicketMaterial(name: 'Cat6 Cable', quantity: '- 02', isIssued: true),
    const TicketMaterial(name: 'RJ45 Jack', quantity: '- 20', isIssued: false),
    const TicketMaterial(
        name: 'Crimping Tool', quantity: '- 02', isIssued: true),
    const TicketMaterial(
        name: 'Network Switch', quantity: '- 01', isIssued: false),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _seconds.value++;
      final h = (_seconds.value ~/ 3600).toString().padLeft(2, '0');
      final m = ((_seconds.value % 3600) ~/ 60).toString().padLeft(2, '0');
      final s = (_seconds.value % 60).toString().padLeft(2, '0');
      timerDisplay.value = '$h:$m:$s';
    });
    // Start at 3:10:00 for demo purposes
    _seconds.value = 3 * 3600 + 10 * 60;
  }

  void onViewPdf() {
    // TODO: open PDF
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
