import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ighty_support/controller/dashboard/admin_leave_management_controller.dart';
import 'package:ighty_support/generated/assets.dart';
import 'package:ighty_support/utils/app_text.dart';
import 'package:ighty_support/utils/comman_background.dart';

class AdminLeaveManagementScreen
    extends GetView<AdminLeaveManagementController> {
  const AdminLeaveManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommanScaffold(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const AppText(
                            text: "Hello Admin!",
                            textSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0, top: 4.0),
                        child: AppText(
                          text: "Leave Management",
                          textSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      Assets.iconProfileIcon,
                      fit: BoxFit.cover,
                      errorBuilder: (ctx, err, st) =>
                          const Icon(Icons.account_circle, size: 40),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Obx(
                  () => ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: controller.requests.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      final request = controller.requests[index];
                      return Obx(() {
                        bool isActioned = request.status.value != 'pending';
                        return Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFFA270),
                                    Color(0xFFFF6A74),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.engineering_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: AppText(
                                text: "${request.name} Applied for an Leave",
                                textSize: 13,
                                color: const Color(0xFFA1081A),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            if (isActioned)
                              AppText(
                                text:
                                    request.status.value.capitalizeFirst ?? "",
                                color: request.status.value == 'approved'
                                    ? Colors.green
                                    : Colors.red,
                                textSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            if (!isActioned) ...[
                              // Approve Button
                              GestureDetector(
                                onTap: () => controller.approve(index),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFA1081A),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: const AppText(
                                    text: "Approve",
                                    color: Colors.white,
                                    textSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              // Deny Button
                              GestureDetector(
                                onTap: () => controller.deny(index),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: AppText(
                                    text: "Deny",
                                    color: Colors.red.shade900,
                                    textSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        );
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ).paddingSymmetric(vertical: 40),
      ),
    );
  }
}
