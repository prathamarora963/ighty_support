import 'package:ighty_support/utils/all_imports.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: commonAppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
          ),
        ),
        isLeading: true,
        title: "Terms",
        textColor: AppColor.themeColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              text: "IGHTYSUPPORT Terms",
              color: AppColor.darkGrey,
              textSize: 16,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: AppText(
                  text:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  color: AppColor.darkGrey,
                  textSize: 16,
                  lineHeight: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Got it Button
            AppButton(
              text: "Got it",
              onTap: () {
                Get.back();
              },
              buttonColor: AppColor.themeColor,
              textColor: Colors.white,
              borderRadius: 8,
            ),
          ],
        ),
      ),
    );
  }
}
