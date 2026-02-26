import 'package:ighty_support/controller/dashboard/active_tech_controller.dart';
import 'package:ighty_support/generated/assets.dart';
import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/comman_background.dart';

class ActiveTechScreen extends GetView<ActiveTechController> {
  const ActiveTechScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

            // List
            Expanded(
              child: Obx(
                () => ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  itemCount: controller.techs.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 25),
                  itemBuilder: (context, index) {
                    final tech = controller.techs[index];
                    return Row(
                      children: [
                        // Avatar and Indicator
                        SizedBox(
                          width: 55,
                          height: 55,
                          child: Stack(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade200,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    tech.imagePath,
                                    fit: BoxFit.cover,
                                    errorBuilder: (ctx, err, st) => const Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: tech.isOnline
                                        ? const Color(0xFF67E345)
                                        : Colors.grey.shade400,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        // Name
                        Expanded(
                          child: AppText(
                            text: tech.name,
                            textSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        // Edit Button
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFA1081A),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const AppText(
                            text: "Edit",
                            color: Colors.white,
                            textSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Activate/Deactivate Toggle
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.toggleActivate(index);
                            },
                            child: Container(
                              width: 100, // Fixed width to keep alignment
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: tech.isActive.value
                                    ? Colors.white
                                    : const Color(0xFFA1081A),
                                borderRadius: BorderRadius.circular(20),
                                border: tech.isActive.value
                                    ? Border.all(
                                        color: const Color(0xFFA1081A),
                                        width: 1.5,
                                      )
                                    : null,
                              ),
                              child: AppText(
                                text: tech.isActive.value
                                    ? "Deactivate"
                                    : "Activate",
                                color: tech.isActive.value
                                    ? const Color(0xFFA1081A)
                                    : Colors.white,
                                textSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
