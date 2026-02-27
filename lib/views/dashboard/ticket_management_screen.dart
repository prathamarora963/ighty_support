import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ighty_support/generated/assets.dart';
import 'package:ighty_support/utils/app_button.dart';
import 'package:ighty_support/utils/app_color.dart';
import 'package:ighty_support/utils/app_text.dart';
import 'package:ighty_support/utils/app_text_field.dart';
import 'package:ighty_support/utils/comman_background.dart';
import 'package:ighty_support/utils/dropdown_field.dart';

class TicketManagementScreen extends StatelessWidget {
  TicketManagementScreen({super.key});

  final RxString selectedSite = "Assign Site".obs;
  final RxString selectedTech = "Technician 1".obs;
  final RxString selectedFolder = "Site 1".obs;
  final RxBool isPriority = true.obs;

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 15),
      child: AppText(
        text: text,
        textSize: 14,
        color: AppColor.blackColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommanScaffold(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
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
              const SizedBox(height: 10),
              
              const AppText(
                text: "Ticket\nManagement",
                color: AppColor.themeColor,
                textSize: 26,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 20),

              // Form Container
              Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Form Header
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: const AppText(
                        text: "Please fill below details to update",
                        textSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    // Form Body
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel("Description:"),
                          AppTextField(
                            hintText: "Enter Description",
                            fillColor: const Color(0xFFFBEAEA),
                            borderRadius: 8,
                          ),
                          
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildLabel("Select Site:"),
                                    DropdownField<String>(
                                      selectedValue: selectedSite,
                                      fillColor: const Color(0xFFFBEAEA),
                                      borderRadius: 8,
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      items: (val) => [
                                        const DropdownMenuItem(value: "Assign Site", child: Text("Assign Site")),
                                        const DropdownMenuItem(value: "Site 1", child: Text("Site 1")),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildLabel("Assign Technician:"),
                                    DropdownField<String>(
                                      selectedValue: selectedTech,
                                      fillColor: const Color(0xFFFBEAEA),
                                      borderRadius: 8,
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      items: (val) => [
                                        const DropdownMenuItem(value: "Technician 1", child: Text("Technician 1")),
                                        const DropdownMenuItem(value: "Technician 2", child: Text("Technician 2")),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          _buildLabel("Add Materials:"),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: AppTextField(
                                  hintText: "Item name..",
                                  fillColor: const Color(0xFFFBEAEA),
                                  borderRadius: 8,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: AppTextField(
                                  hintText: "Qty..",
                                  fillColor: const Color(0xFFFBEAEA),
                                  borderRadius: 8,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                decoration: const BoxDecoration(
                                  color: AppColor.themeColor,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.add, color: AppColor.whiteColor),
                                  onPressed: () {},
                                  constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                                  padding: EdgeInsets.zero,
                                ),
                              )
                            ],
                          ),

                          _buildLabel("Assign Folder:"),
                          FractionallySizedBox(
                            widthFactor: 0.45,
                            child: DropdownField<String>(
                              selectedValue: selectedFolder,
                              fillColor: const Color(0xFFFBEAEA),
                              borderRadius: 8,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              items: (val) => [
                                const DropdownMenuItem(value: "Site 1", child: Text("Site 1")),
                                const DropdownMenuItem(value: "Site 2", child: Text("Site 2")),
                              ],
                            ),
                          ),

                          _buildLabel("Expected Completion Duration:"),
                          AppTextField(
                            hintText: "Enter value in numeric",
                            fillColor: const Color(0xFFFBEAEA),
                            borderRadius: 8,
                          ),
                          
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              const AppText(text: "Priority", textSize: 14),
                              const SizedBox(width: 15),
                              Obx(() => Checkbox(
                                value: isPriority.value,
                                onChanged: (val) => isPriority.value = val ?? false,
                                activeColor: AppColor.themeColor,
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Upload section
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE9E9E9),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.cloud_upload_outlined, size: 50, color: Colors.black),
                              const SizedBox(width: 10),
                              Icon(Icons.picture_as_pdf, size: 50, color: Colors.black.withOpacity(0.8)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const AppText(
                            text: "Click here\nor\nDrag and Drop the PDF File",
                            textSize: 14,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    // Submit button
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: AppButton(
                        text: "Submit",
                        onTap: () {},
                        buttonColor: AppColor.whiteColor,
                        borderColor: AppColor.themeColor,
                        textColor: AppColor.themeColor,
                        borderRadius: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
