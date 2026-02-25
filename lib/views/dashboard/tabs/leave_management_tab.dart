import 'package:ighty_support/controller/dashboard/leave_management_controller.dart';
import 'package:ighty_support/generated/assets.dart';
import 'package:ighty_support/routes/routes_page.dart';
import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/app_string.dart';

class LeaveManagementTab extends GetView<LeaveManagementController> {
  const LeaveManagementTab({super.key});

  static const List<String> _leaveTypes = [
    AppString.maternityLeave,
    AppString.sickLeave,
    AppString.casualLeave,
    AppString.earnedLeave,
    AppString.paternityLeave,
    AppString.emergencyLeave,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAEEEE),
      body: Column(
        children: [
          // ── Header ─────────────────────────────────────────────────────
          _buildHeader(),

          // ── Form Card ──────────────────────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Leave Type Dropdown ─────────────────────────────
                    _SectionLabel(text: AppString.selectLeaveType),
                    const SizedBox(height: 8),
                    Obx(() => _LeaveDropdown(
                          selectedValue: controller.selectedLeaveType.value,
                          items: _leaveTypes,
                          onChanged: (val) =>
                              controller.selectedLeaveType.value = val,
                        )),

                    const SizedBox(height: 20),

                    // ── Date Row ────────────────────────────────────────
                    Row(
                      children: [
                        Expanded(
                          child: Obx(() => _DateField(
                                label: AppString.startDate,
                                value: controller.startDate.value,
                                onTap: controller.pickStartDate,
                              )),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Obx(() => _DateField(
                                label: AppString.endDate,
                                value: controller.endDate.value,
                                onTap: controller.pickEndDate,
                              )),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // ── Reason ──────────────────────────────────────────
                    _SectionLabel(text: AppString.reasonForLeave),
                    const SizedBox(height: 8),
                    _ReasonField(controller: controller.reasonController),

                    const SizedBox(height: 20),

                    // ── Half Day Checkbox ────────────────────────────────
                    Obx(() => _HalfDayRow(
                          value: controller.isHalfDay.value,
                          onChanged: controller.toggleHalfDay,
                        )),

                    const SizedBox(height: 24),

                    // ── Buttons ────────────────────────────────────────
                    Row(
                      children: [
                        Expanded(
                          child: _CancelButton(onTap: controller.onCancel),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: AppButton(
                            text: AppString.apply,
                            onTap: controller.onApply,
                            isGradient: true,
                            borderRadius: 30,
                            height: 48,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Header ─────────────────────────────────────────────────────────────────
  Widget _buildHeader() {
    return Container(
      color: const Color(0xFFFAEEEE),
      padding: const EdgeInsets.fromLTRB(20, 56, 20, 16),
      child: Row(
        children: [
          Expanded(
            child: AppText(
              text: AppString.helloUser,
              textSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColor.blackColor,
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.profileScreen),
            child: Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF0F0F0),
              ),
              child: Image.asset(Assets.iconProfileIcon),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Section Label ─────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return AppText(
      text: text,
      textSize: 13,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF888888),
    );
  }
}

// ── Leave Type Dropdown ───────────────────────────────────────────────────────

class _LeaveDropdown extends StatelessWidget {
  final String selectedValue;
  final List<String> items;
  final ValueChanged<String> onChanged;

  const _LeaveDropdown({
    required this.selectedValue,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black54),
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(10),
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
          ),
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (val) {
            if (val != null) onChanged(val);
          },
        ),
      ),
    );
  }
}

// ── Date Field ────────────────────────────────────────────────────────────────

class _DateField extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  const _DateField({
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: label,
          textSize: 13,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF888888),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 18,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── Reason Text Area ──────────────────────────────────────────────────────────

class _ReasonField extends StatelessWidget {
  final TextEditingController controller;
  const _ReasonField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        maxLines: 5,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          color: Colors.black87,
        ),
        decoration: const InputDecoration(
          hintText: AppString.writeReasonForLeave,
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: Color(0xFFAAAAAA),
            fontWeight: FontWeight.w400,
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

// ── Half Day Row ──────────────────────────────────────────────────────────────

class _HalfDayRow extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _HalfDayRow({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          text: AppString.isHalfDayLeave,
          textSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColor.blackColor,
        ),
        const Spacer(),
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          side: const BorderSide(color: Colors.blue, width: 1.5),
        ),
      ],
    );
  }
}

// ── Cancel Button ─────────────────────────────────────────────────────────────

class _CancelButton extends StatelessWidget {
  final VoidCallback onTap;
  const _CancelButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColor.themeColor, width: 1.5),
        ),
        child: Center(
          child: AppText(
            text: AppString.cancel,
            textSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColor.themeColor,
          ),
        ),
      ),
    );
  }
}
