import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ighty_support/generated/assets.dart';
import 'package:ighty_support/utils/app_button.dart';
import 'package:ighty_support/utils/app_color.dart';
import 'package:ighty_support/utils/app_text.dart';
import 'package:ighty_support/utils/app_text_field.dart';
import 'package:ighty_support/utils/comman_background.dart';
import 'package:ighty_support/utils/date_time_picker.dart';
import 'package:ighty_support/utils/dropdown_field.dart';
import 'package:ighty_support/views/dashboard/ticket_management_screen.dart';

class AdminTicketScreen extends StatelessWidget {
  AdminTicketScreen({super.key});

  final RxString _startDate = "08, Aug, 2025".obs;
  final RxString _endDate = "08, Aug, 2025".obs;
  final RxString _selectedTech = "Technician".obs;
  final RxString _selectedSite = "Site Location".obs;

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColor.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 30,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(
                text: "Filter by Date",
                textSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.darkGrey,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppText(
                          text: "Start Date",
                          textSize: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () async {
                            String date = await DateTimePicker.selectDate(
                              dateFormat: "dd, MMM, yyyy",
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (date.isNotEmpty) {
                              _startDate.value = date;
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xffF6F6F6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() => AppText(
                                  text: _startDate.value,
                                  textSize: 14,
                                  color: AppColor.darkGrey,
                                )),
                                const Icon(Icons.calendar_month_outlined, size: 20, color: AppColor.darkGrey),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppText(
                          text: "End Date",
                          textSize: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () async {
                            String date = await DateTimePicker.selectDate(
                              dateFormat: "dd, MMM, yyyy",
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (date.isNotEmpty) {
                              _endDate.value = date;
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xffF6F6F6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() => AppText(
                                  text: _endDate.value,
                                  textSize: 14,
                                  color: AppColor.darkGrey,
                                )),
                                const Icon(Icons.calendar_month_outlined, size: 20, color: AppColor.darkGrey),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: DropdownField<String>(
                      selectedValue: _selectedTech,
                      fillColor: AppColor.whiteColor,
                      isBoxShadow: true,
                      blurRadius: 2,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      borderRadius: 8,
                      items: (val) => [
                        const DropdownMenuItem(value: "Technician", child: Text("Technician")),
                        const DropdownMenuItem(value: "Tech 1", child: Text("Tech 1")),
                        const DropdownMenuItem(value: "Tech 2", child: Text("Tech 2")),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: DropdownField<String>(
                      selectedValue: _selectedTech, // Reuse for visual layout, or create a parallel one
                      fillColor: AppColor.whiteColor,
                      isBoxShadow: true,
                      blurRadius: 2,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      borderRadius: 8,
                      items: (val) => [
                        const DropdownMenuItem(value: "Technician", child: Text("Technician")),
                        const DropdownMenuItem(value: "Tech 1", child: Text("Tech 1")),
                        const DropdownMenuItem(value: "Tech 2", child: Text("Tech 2")),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              FractionallySizedBox(
                widthFactor: 0.48,
                child: DropdownField<String>(
                  selectedValue: _selectedSite,
                  fillColor: AppColor.whiteColor,
                  isBoxShadow: true,
                  blurRadius: 2,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  borderRadius: 8,
                  items: (val) => [
                    const DropdownMenuItem(value: "Site Location", child: Text("Site Location")),
                    const DropdownMenuItem(value: "Dallas Hospital", child: Text("Dallas Hospital")),
                    const DropdownMenuItem(value: "Museum", child: Text("Museum")),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      text: "Cancel",
                      buttonColor: const Color(0xffE6DADA),
                      textColor: AppColor.themeColor,
                      elevation: 0,
                      onTap: () => Get.back(),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: AppButton(
                      text: "Apply Filter",
                      buttonColor: AppColor.themeColor,
                      textColor: AppColor.whiteColor,
                      elevation: 0,
                      onTap: () {
                        // Apply filter logic
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => TicketManagementScreen());
        },
        backgroundColor: AppColor.themeColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(Icons.add, color: AppColor.whiteColor, size: 30),
      ),
      body: CommanScaffold(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppText(
                    text: 'Hello Admin,',
                    textSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColor.blackColor,
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
              const SizedBox(height: 20),
              // Search Box Container
              Container(
                width: Get.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 11,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffF1F1F1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      text: "Enter Ticket Details",
                      textSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 10),
                    AppTextField(
                      prefixIcon: Icon(Icons.search),
                      borderRadius: 100,
                      fillColor: Color(0xffE9E9E9),
                      hintText: "Enter Ticket ID/Name",
                    ),
                    // Filter Icon
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () => _showFilterBottomSheet(context),
                        icon: const Icon(
                          Icons.filter_list,
                          color: AppColor.themeColor,
                          size: 32,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(color: AppColor.whiteColor),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: AppText(
                                text: "Ticket Id",
                                textSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.blackColor,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: AppText(
                                text: "Name",
                                textSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.blackColor,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: AppText(
                                text: "Tech",
                                textSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.blackColor,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: AppText(
                                text: "View Tickets",
                                textSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.blackColor,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // List
                    Container(
                      decoration: BoxDecoration(color: AppColor.whiteColor),

                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey.shade200,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: AppText(
                                    text: index == 1
                                        ? "Ighty22893/\n8-12-25 193"
                                        : "Ighty22899/\n8-6-25 199",
                                    textSize: 13,
                                    color: AppColor.darkGrey,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: AppText(
                                    text: index == 1
                                        ? "meuseum"
                                        : "Dallas\nHospital",
                                    textSize: 13,
                                    color: AppColor.darkGrey,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: AppText(
                                    text:
                                        "Tech ${index == 1 ? 2 : (index == 2 ? 3 : 1)}",
                                    textSize: 13,
                                    color: AppColor.darkGrey,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.themeColor,
                                      foregroundColor: AppColor.whiteColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 0,
                                      ),
                                      minimumSize: const Size(0, 32),
                                    ),
                                    child: const AppText(
                                      text: "View Tickets",
                                      textSize: 11,
                                      color: AppColor.whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Table Content
              const SizedBox(height: 80), // For FAB clearance
            ],
          ),
        ),
      ),
    );
  }
}
