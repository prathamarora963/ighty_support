import 'all_imports.dart';

class DialogHelper {
  static void successDialog(
      {required VoidCallback onTap,
      String title = "",
      String message = '',
      String? yesButtonText,
      bool isCloseBtn = false,
      double? textSize,
      TextAlign? textAlign,
      double? lineHeight,
      bool? barrierDismissible}) {
      showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: barrierDismissible ?? false,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      context: Get.context!,
      pageBuilder: (context, anim1, anim2) {
        return Material(
          type: MaterialType.transparency,
          child: Align(
            alignment: Alignment.center,
            child: PopScope(
              canPop: barrierDismissible ?? false,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: isCloseBtn == true ? 13 : 20,
                    bottom: 20),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    isCloseBtn == true
                        ? Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                margin: EdgeInsets.zero,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 3),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.redColor),
                                child: const Icon(
                                  Icons.close_rounded,
                                  size: 18,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    AppText(
                      text: title,
                      textSize: AppTextSize.textSize20,
                      fontWeight: AppTextWeight.boldText,
                    ).paddingOnly(top: 5, bottom: 7),
                    AppText(
                      text: message,
                      textSize: textSize ?? 16,
                      textAlign: textAlign ?? TextAlign.center,
                      color: AppColor.blackColor.withValues(alpha:0.7),
                      lineHeight: lineHeight ?? 1.5,
                    ),
                    const SizedBox(height: 20),
                    AppButton(
                      width: 139,
                      onTap: onTap,
                      text: yesButtonText ?? AppString.ok,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void showDividerDialog(
      {required VoidCallback onTap,
      String heading = "",
      String title = "",
      String message = '',
      String? buttonText,
      bool isCloseBtn = false,
      double? textSize,
      TextAlign? textAlign,
      double? lineHeight,
      bool? barrierDismissible}) {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: barrierDismissible ?? false,
      barrierColor: Colors.black.withValues(alpha:0.5),
      context: Get.context!,
      pageBuilder: (context, anim1, anim2) {
        return Material(
          type: MaterialType.transparency,
          child: Align(
            alignment: Alignment.center,
            child: PopScope(
              canPop: barrierDismissible ?? false,
              child: Container(
                padding: EdgeInsets.only(top: isCloseBtn ? 10 : 15, bottom: 25),
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    isCloseBtn
                        ? Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 20),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 3),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.redColor),
                                child: const Icon(
                                  Icons.close_rounded,
                                  size: 18,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    AppText(
                      text: heading,
                      fontWeight: AppTextWeight.mediumText,
                      color: AppColor.blackColor.withValues(alpha:0.7),
                    ).paddingSymmetric(horizontal: 20),
                    AppText(
                      text: title,
                      textSize: AppTextSize.textSize21,
                      fontWeight: AppTextWeight.boldText,
                    ).paddingSymmetric(vertical: 3, horizontal: 20),
                    Divider(color: AppColor.blackColor.withValues(alpha:0.1)),
                    AppText(
                      text: message,
                      textSize: textSize,
                      fontWeight: FontWeight.w500,
                      textAlign: textAlign ?? TextAlign.center,
                      lineHeight: lineHeight ?? 1.4,
                    ).paddingSymmetric(horizontal: 25, vertical: 8),
                    const SizedBox(height: 20),
                    AppButton(
                      width: 139,
                      onTap: onTap,
                      text: buttonText ?? AppString.ok,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void deleteAlertDialog(
      {required String title,
      required String message,
      Color? iconBackgroundColor,
      Color? iconColor,
      double? iconSize,
      required Function action}) {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (_) {
          return Dialog(
            alignment: Alignment.center,
            insetPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                color: AppColor.whiteColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: iconBackgroundColor ?? AppColor.themeColor,
                    child: const Icon(
                      Icons.logout_rounded,
                      color: AppColor.whiteColor,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  title.isNotEmpty
                      ? AppText(
                          text: title,
                          textSize: 18,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                          color: AppColor.blackColor)
                      : Container(),
                  title.isNotEmpty
                      ? const SizedBox(
                          height: 12,
                        )
                      : Container(),
                  AppText(
                      text: message,
                      textSize: 16,
                      lineHeight: 1.5,
                      fontWeight:
                          title.isNotEmpty ? FontWeight.w500 : FontWeight.w700,
                      textAlign: TextAlign.center,
                      color: title.isNotEmpty
                          ? AppColor.blackColor.withValues(alpha:0.5)
                          : AppColor.blackColor),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: AppButton(
                            onTap: () {
                              action();
                            },
                            text: AppString.yes),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: AppButton(
                          textColor: AppColor.themeColor,
                          borderColor: AppColor.themeColor,
                            buttonColor: AppColor.whiteColor,
                            onTap: () {
                              Get.back();
                            },
                            text: AppString.no),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
  static void logoutDialog(
      {required String title,
      required String message,
      Color? iconBackgroundColor,
      Color? iconColor,
      double? iconSize,
      required Function action}) {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (_) {
          return Dialog(
            alignment: Alignment.center,
            insetPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: AppColor.whiteColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: iconBackgroundColor ?? AppColor.themeColor,
                    child: const Icon(
                      Icons.logout_rounded,
                      color: AppColor.whiteColor,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  title.isNotEmpty
                      ? AppText(
                          text: title,
                          textSize: 20,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          color: AppColor.blackColor)
                      : Container(),
                  title.isNotEmpty
                      ? const SizedBox(
                          height: 12,
                        )
                      : Container(),
                  AppText(
                      text: message,
                      textSize: 13,
                      lineHeight: 1.5,
                      textAlign: TextAlign.center,
                      color: title.isNotEmpty
                          ? AppColor.blackColor.withValues(alpha:0.5)
                          : AppColor.blackColor),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: AppButton(
                            onTap: () {
                              action();
                            },
                            text: AppString.yes),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: AppButton(
                          textColor: AppColor.blackColor,
                          borderColor: AppColor.greyColor,
                            buttonColor: AppColor.whiteColor,
                            onTap: () {
                              Get.back();
                            },
                            text: AppString.no),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }static void deleteAccountDialog(
      {required String title,
      required String message,
      Color? iconBackgroundColor,
      Color? iconColor,
      double? iconSize,
      required Function action}) {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (_) {
          return Dialog(
            alignment: Alignment.center,
            insetPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: AppColor.whiteColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: iconBackgroundColor ?? AppColor.themeColor,
                    child: const Icon(
                      Icons.logout_rounded,
                      color: AppColor.whiteColor,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  title.isNotEmpty
                      ? AppText(
                          text: title,
                          textSize: 20,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          color: AppColor.blackColor)
                      : Container(),
                  title.isNotEmpty
                      ? const SizedBox(
                          height: 12,
                        )
                      : Container(),
                  AppText(
                      text: message,
                      textSize: 13,
                      lineHeight: 1.5,
                      textAlign: TextAlign.center,
                      color: title.isNotEmpty
                          ? AppColor.blackColor.withValues(alpha:0.5)
                          : AppColor.blackColor),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: AppButton(
                            onTap: () {
                              action();
                            },
                            text: AppString.yes),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: AppButton(
                          textColor: AppColor.blackColor,
                          borderColor: AppColor.greyColor,
                            buttonColor: AppColor.whiteColor,
                            onTap: () {
                              Get.back();
                            },
                            text: AppString.no),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
