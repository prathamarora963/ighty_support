import 'package:ighty_support/controller/dashboard/all_customers_controller.dart';
import 'package:ighty_support/generated/assets.dart';
import 'package:ighty_support/routes/routes_page.dart';
import 'package:ighty_support/utils/all_imports.dart';
import 'package:ighty_support/utils/comman_background.dart';

class AllCustomersScreen extends GetView<AllCustomersController> {
  const AllCustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.registerCustomerScreen);
        },
        backgroundColor: const Color(0xFFA1081A),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
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

            const Divider(color: Colors.grey, thickness: 0.5),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: const AppText(
                  text: "All Customers",
                  textSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            // List
            Expanded(
              child: Obx(
                () => ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  itemCount: controller.customers.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 25),
                  itemBuilder: (context, index) {
                    final customer = controller.customers[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Avatar
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade200,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              customer.imagePath,
                              fit: BoxFit.cover,
                              errorBuilder: (ctx, err, st) => const Icon(
                                Icons.person,
                                color: Colors.grey,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        // Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: customer.name,
                                textSize: 15,
                                color: Colors.black87,
                                fontWeight: FontWeight.normal,
                              ),
                              const SizedBox(height: 2),
                              AppText(
                                text: customer.location,
                                textSize: 15,
                                color: Colors.black87,
                                fontWeight: FontWeight.normal,
                              ),
                              const SizedBox(height: 2),
                              AppText(
                                text: customer.service,
                                textSize: 15,
                                color: Colors.black87,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                        ),
                        // Edit Icon
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.edit_outlined,
                            color: Colors.black87,
                            size: 24,
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
