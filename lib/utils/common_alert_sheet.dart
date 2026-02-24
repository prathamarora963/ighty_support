import 'all_imports.dart';

class CommonAlertSheet {
  successBottomSheet(
      {required String imageLogo,
      required String heading,
      required String subTitle,
      required String buttonText,
      required Function() buttonAction}) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      context: Get.context!,
      builder: (context) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: AppColor.whiteColor,
            width: context.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  imageLogo,
                  width: 55,
                  height: 50,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppText(
                  text: heading,
                  textAlign: TextAlign.center,
                  textSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 4,
                ),
                AppText(
                  text: subTitle,
                  lineHeight: 1.4,
                  textAlign: TextAlign.center,
                  textSize: 16,
                  color: AppColor.blackColor.withValues(alpha:0.5),
                ),
                SizedBox(
                  height: context.height * 0.07,
                ),
                AppButton(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  height: 55,
                  text: buttonText,
                  textSize: 14,
                  fontWeight: FontWeight.w400,
                  onTap: buttonAction,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  successSheet({
    required String imageLogo,
    Color? imageLogoColor,
    bool? showTextField = false,
    bool? crossButton = true,
    double? imageHeight,
    double? imageWidth,
    required String heading,
    required String subHeading,
    required String buttonText,
    required String buttonText2,
    required Function() buttonAction,
    required Function() buttonAction2,
  }) {
    showModalBottomSheet(
      isDismissible: false,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(35), topLeft: Radius.circular(35))),
      context: Get.context!,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
            ),
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 20),
            width: context.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (crossButton!)
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Icon(
                            Icons.close_rounded,
                            size: 26,
                            color: AppColor.redColor,
                          ),
                        ),
                      ),
                    ),
                  Image.asset(
                    imageLogo,
                    width: imageWidth ?? 30,
                    height: imageHeight ?? 33,
                    color: imageLogoColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppText(
                    text: heading,
                    textAlign: TextAlign.center,
                    textSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  showTextField == false
                      ? AppText(
                          text: subHeading,
                          textAlign: TextAlign.center,
                          textSize: AppTextSize.textSize12,
                          fontWeight: FontWeight.w500,
                          color: AppColor.blackColor.withValues(alpha:0.4),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: AppTextField(
                            textInputAction: TextInputAction.done,
                            maxLines: 4,
                            title: "Reason",
                            hintText: AppString.writeHere,
                            contentPadding: const EdgeInsets.only(
                                top: 25, left: 13, right: 5, bottom: 5),
                          ),
                        ),
                  SizedBox(
                    height: context.height * 0.04,
                  ),
                  AppButton(
                    text: buttonText,
                    textSize: 14,
                    fontWeight: FontWeight.w500,
                    onTap: buttonAction,
                  ),
                  if (showTextField == false)
                    AppButton(
                      buttonColor: AppColor.whiteColor,
                      borderColor: Colors.transparent,
                      textColor: Colors.black,
                      text: buttonText2,
                      textSize: 14,
                      fontWeight: FontWeight.w500,
                      onTap: buttonAction2,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
