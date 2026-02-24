import 'all_imports.dart';

AppBar commonAppBar({
  String? title,
  Color? backButtonColor,
  Widget? titleWidget,
  required bool isLeading,
  double? toolbarHeight,
  double? textSize,
  SystemUiOverlayStyle? systemOverlayStyle,
  Color? backgroundColor,
  Color? iconColor,
  Color? surfaceTintColor,
  Color? textColor,
  double? leadingWidth,
  double? titleSpacing,
  ShapeBorder? shape,
  bool? centerTitle,
  Widget? leading,
  bool settingBack = false,
  bool? automaticallyImplyLeading,
  void Function()? onPressed,
  void Function()? onTap,
  List<Widget>? actions,
}) {
  return AppBar(
    titleSpacing: titleSpacing ?? 10.0,
    shape: shape,
    title: GestureDetector(
      onTap: onTap,
      child:
          titleWidget ??
          AppText(
            text: title ?? "",
            textSize: textSize ?? 20,
            fontWeight: FontWeight.bold,
            color: textColor ?? Colors.black,
            maxLines: 2,
            textAlign: TextAlign.center,
            lineHeight: 1.3,
          ),
    ),
    elevation: 0,
    toolbarHeight: toolbarHeight,
    systemOverlayStyle:
        systemOverlayStyle ??
        SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
        ),
    leadingWidth: leadingWidth ?? 50,
    leading: isLeading
        ? Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 3),
            child:
                leading ??
                GestureDetector(
                  onTap: () => onPressed != null ? onPressed() : Get.back(),
                  child: settingBack
                      ? Icon(Icons.arrow_back, color: AppColor.whiteColor)
                      : Container(
                          margin: EdgeInsets.symmetric(vertical: 11),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: backButtonColor ?? AppColor.themeColor,
                          ),
                          child: Icon(Icons.arrow_back, size: 20),
                        ),
                ),
          )
        : null,
    centerTitle: centerTitle ?? true,
    backgroundColor: backgroundColor ?? Colors.transparent,
    surfaceTintColor: surfaceTintColor ?? Colors.transparent,
    actions: actions,
  );
}
