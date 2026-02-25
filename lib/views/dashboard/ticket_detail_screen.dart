import 'package:ighty_support/controller/dashboard/ticket_detail_controller.dart';
import 'package:ighty_support/routes/routes_page.dart';
import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/app_string.dart';

class TicketDetailScreen extends GetView<TicketDetailController> {
  const TicketDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Map ──────────────────────────────────────────────────
            _buildMap(),

            // ── Address ─────────────────────────────────────────────
            _buildAddress(),

            const SizedBox(height: 16),

            // ── Ticket Details Card ──────────────────────────────────
            _buildDetailsCard(),

            const SizedBox(height: 20),

            // ── Materials ───────────────────────────────────────────
            _buildMaterials(),

            const SizedBox(height: 24),

            // ── Bottom Actions ───────────────────────────────────────
            _buildBottomActions(),

            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }

  // ── AppBar ─────────────────────────────────────────────────────────────────
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFCCCCCC), width: 1.5),
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 15,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      title: AppText(
        text: AppString.ticketDetails,
        textSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColor.themeColor,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.timer_outlined,
                  color: AppColor.themeColor,
                  size: 18,
                ),
                const SizedBox(width: 4),
                AppText(
                  text: controller.timerDisplay.value,
                  textSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColor.themeColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ── Map ────────────────────────────────────────────────────────────────────
  Widget _buildMap() {
    return Container(
      height: 200,
      width: double.infinity,
      color: const Color(0xFFE8E8E8),
      child: Stack(
        children: [
          // Map placeholder with route feel
          ImageView.rect(
            image:
                'https://maps.googleapis.com/maps/api/staticmap?center=Dallas,TX&zoom=13&size=600x300&maptype=roadmap&path=color:0x0000ff|weight:5|32.7767,-96.7970|32.7867,-96.8070&key=YOUR_KEY',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          // Route info overlay
          Positioned(
            bottom: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF1A6FBF),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '22 min',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'More bike lanes',
                    style: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'Poppins',
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 80,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Text(
                    '19 min',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Best route',
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 20,
            left: 24,
            child: Icon(Icons.location_pin, color: Colors.red, size: 32),
          ),
        ],
      ),
    );
  }

  // ── Address ────────────────────────────────────────────────────────────────
  Widget _buildAddress() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Obx(
        () => RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Address: ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColor.themeColor,
                ),
              ),
              TextSpan(
                text: controller.address.value,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Details Card ───────────────────────────────────────────────────────────
  Widget _buildDetailsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Obx(
        () => Column(
          children: [
            _detailRow(AppString.ticketTitle, controller.ticketTitle.value),
            _divider(),
            _detailRow(AppString.ticketIdRef, controller.referenceNumber.value),
            _divider(),
            _detailRow(
              AppString.assignedSiteName,
              '${controller.siteName.value}\n${controller.siteAddress.value}',
            ),
            _divider(),
            _detailRow(AppString.description, controller.description.value),
            _divider(),
            _detailRow(
              AppString.assignedDateTime,
              '${controller.assignedDate.value}\n${controller.assignedTime.value}',
            ),
            _divider(),
            _detailRow(
              AppString.expectedCompletionTime,
              '${controller.expectedDate.value}\n${controller.expectedTime.value}',
            ),
            _divider(),
            _detailRow(AppString.priorityLevel, controller.priorityLevel.value),
            _divider(),
            _detailRow(AppString.statusLabel, controller.status.value),
            _divider(),
            // View PDF row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: GestureDetector(
                onTap: controller.onViewPdf,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFCCCCCC),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.picture_as_pdf_outlined,
                        size: 22,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(width: 12),
                    AppText(
                      text: AppString.viewPdf,
                      textSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColor.blackColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: AppText(
              text: label,
              textSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColor.themeColor,
            ),
          ),
          Expanded(
            child: AppText(
              text: value,
              textSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColor.blackColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() =>
      const Divider(height: 1, thickness: 1, color: Color(0xFFF0F0F0));

  // ── Materials ──────────────────────────────────────────────────────────────
  Widget _buildMaterials() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: AppString.materials,
            textSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColor.themeColor,
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Obx(
              () => Column(
                children: List.generate(controller.materials.length, (i) {
                  final m = controller.materials[i];
                  final isLast = i == controller.materials.length - 1;
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: AppText(
                                text: m.name,
                                textSize: 13,
                                fontWeight: FontWeight.w500,
                                color: AppColor.blackColor,
                              ),
                            ),
                            AppText(
                              text: m.quantity,
                              textSize: 13,
                              fontWeight: FontWeight.w400,
                              color: AppColor.blackColor,
                            ),
                            const SizedBox(width: 24),
                            SizedBox(
                              width: 60,
                              child: AppText(
                                text: m.isIssued
                                    ? AppString.issued
                                    : AppString.avail,
                                textSize: 13,
                                fontWeight: FontWeight.w600,
                                color: m.isIssued
                                    ? AppColor.themeColor
                                    : AppColor.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!isLast)
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Color(0xFFF0F0F0),
                        ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Bottom Actions ─────────────────────────────────────────────────────────
  Widget _buildBottomActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // ← Go Back
          GestureDetector(
            onTap: () => Get.back(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.arrow_back_rounded,
                  color: AppColor.themeColor,
                  size: 20,
                ),
                const SizedBox(width: 6),
                AppText(
                  text: 'Go Back',
                  textSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColor.themeColor,
                ),
              ],
            ),
          ),
          const Spacer(),
          // Upload Files button
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.fileUploadScreen),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: AppColor.themeColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.cloud_upload_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  AppText(
                    text: 'Upload Files',
                    textSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Custom Painter for Map Route ──────────────────────────────────────────────

class _MapRoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = const Color(0xFFCCCCCC)
      ..strokeWidth = 14
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final routePaint = Paint()
      ..color = const Color(0xFF4285F4)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Background roads
    canvas.drawLine(
      Offset(0, size.height * 0.4),
      Offset(size.width, size.height * 0.4),
      roadPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.5, 0),
      Offset(size.width * 0.5, size.height),
      roadPaint,
    );

    // Route path
    final path = Path();
    path.moveTo(size.width * 0.1, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.4,
      size.width * 0.5,
      size.height * 0.4,
    );
    path.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.4,
      size.width * 0.9,
      size.height * 0.7,
    );
    canvas.drawPath(path, routePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
