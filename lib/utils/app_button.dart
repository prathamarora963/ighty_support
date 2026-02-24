import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_color.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Gradient? gradient;
  final Function onTap;
  final double? width;
  final double? borderWidth;
  final double? borderRadius;
  final Color? textColor;
  final bool isGradient;
  final Color? buttonColor;
  final Color? borderColor;
  final double? textSize;
  final double? elevation;
  final double? height;
  final bool? capitalise;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? margin;
  final IconData? icon;
  final Color? iconColor;

  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.textColor,
    this.borderColor,
    this.textSize,
    this.fontWeight,
    this.height,
    this.isGradient = false,
    this.capitalise,
    this.borderRadius,
    this.borderWidth,
    this.elevation,
    this.margin,
    this.gradient,
    this.buttonColor,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius ?? 14),
      onTap: () => onTap(),
      child: Container(
        width: width ?? Get.width,
        height: height ?? 52,
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          gradient: isGradient
              ? (gradient ??
                    const LinearGradient(
                      colors: [
                        Color(0xffA30000),
                        Color(0xffDA0000),
                        Color(0xffA30000),
                      ],
                    ))
              : null,
          color: buttonColor ?? AppColor.themeColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 14),
          boxShadow: const [
            BoxShadow(
              color: Color(0xff00000029),
              offset: Offset(0, 5),
              blurRadius: 10,
            ),
          ],
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 1.4,
          ),
        ),
        child: Material(
          elevation: elevation ?? 0,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 15),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null)
                  Icon(icon, color: AppColor.whiteColor)
                else
                  const SizedBox.shrink(),
                SizedBox(width: icon != null ? 10 : 0),
                AppText(
                  text: text.tr,
                  color: textColor ?? AppColor.whiteColor,
                  capitalise: capitalise ?? false,
                  fontFamily: "Poppins",
                  textSize: textSize ?? 15.0,
                  fontWeight: fontWeight ?? FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
