import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart' show Prediction;
import 'app_color.dart';
import 'app_text.dart';

Pattern pattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

class CommonTextFieldLocation extends StatefulWidget {
  final String? title;
  final Color? titleColor;
  final double? titleSize;
  final double? cursorHeight;
  final double? titleSpacing;
  final String? hintText;
  final String? counterText;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? hintTextColor;
  final Color? textColor;
  final dynamic maxLines;
  final dynamic minLines;
  final dynamic maxLength;
  final bool? readOnly;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? enabled;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final void Function(Prediction)? getPlaceDetailWithLatLng;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final FocusNode? focusNode;
  final InputBorder? inputBorder;
  final InputBorder? enableBorder;
  final InputBorder? focusedBorder;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final Color? bgColor;
  final Color? cursorColor;
  final Color? borderColor;
  final Color? focusColor;
  final FontWeight? titleFontWeight;
  final Widget? widget;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final EdgeInsetsGeometry? padding;
  final double? blurRadius;
  final double? borderRadius;
  final TextEditingController? goggle;
  final double? elevation;
  final bool isColorOnFocus;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final bool? isDense;
  final bool? isCollapsed;
  final bool? isBoxShadow;

  const CommonTextFieldLocation({
    super.key,
    this.goggle,
    this.inputFormatters,
    this.getPlaceDetailWithLatLng,
    this.padding,
    this.hintText,
    this.elevation,
    this.obscureText,
    this.titleFontWeight,
    this.suffixIconConstraints,
    this.widget,
    this.prefixIcon,
    this.hintTextColor,
    this.focusColor,
    this.borderColor,
    this.textCapitalization,
    this.onTap,
    this.maxLines,
    this.minLines,
    this.suffixIcon,
    this.readOnly,
    this.textInputAction,
    this.keyboardType,
    this.enabled,
    this.focusNode,
    this.cursorHeight,
    this.controller,
    this.onChanged,
    this.textColor,
    this.cursorColor,
    this.counterText,
    this.maxLength,
    this.validator,
    this.title,
    this.titleColor,
    this.titleSize,
    this.inputBorder,
    this.fillColor,
    this.bgColor,
    this.contentPadding,
    this.prefixIconConstraints,
    this.borderRadius,
    this.focusedBorder,
    this.enableBorder,
    this.isDense,
    this.isColorOnFocus = false,
    this.margin,
    this.isCollapsed,
    this.height,
    this.titleSpacing,
    this.isBoxShadow,
    this.blurRadius,
  });

  @override
  State<CommonTextFieldLocation> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextFieldLocation> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: (widget.title ?? "").isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                text: widget.title ?? "",
                color: widget.titleColor ?? Colors.black,
                textSize: widget.titleSize ?? 14,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: widget.titleSpacing ?? 6),
            ],
          ),
        ),
        Container(
          margin: widget.margin,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            border: Border.all(color: AppColor.greyColor),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10,),
            boxShadow:
                widget.isBoxShadow == true
                    ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 0),
                        blurRadius: widget.blurRadius ?? 5,
                      ),
                    ]
                    : [],
          ),
          child: GooglePlaceAutoCompleteTextField(
            focusNode: _focusNode,
            textStyle: TextStyle(
              color: widget.textColor ?? Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 15,
              fontFamily: "Poppins",
            ),
            textEditingController: widget.controller ?? TextEditingController(),
            googleAPIKey: "AIzaSyAUfcfS-mOvbwORjR35N5SSiHQA7w1law0",
            boxDecoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
            ),
            inputDecoration: InputDecoration(
              counterText: widget.counterText,
              hintText: widget.hintText ?? "",
              hintStyle: TextStyle(
                color: widget.textColor ?? Colors.grey,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
                fontSize: 15,
              ),
              border: InputBorder.none,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              suffixIconConstraints: const BoxConstraints(
                minWidth: 46,
                maxWidth: 50,
                minHeight: 25,
                maxHeight: 60,
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 25,
                maxWidth: 100,
                minHeight: 25,
                maxHeight: 60,
              ),
              contentPadding:
                  widget.contentPadding ??
                  const EdgeInsets.only(left: 20, right: 10, top: 0, bottom: 0),
            ),
            isCrossBtnShown: false,
            debounceTime: 800,
            isLatLngRequired: true,
            getPlaceDetailWithLatLng: widget.getPlaceDetailWithLatLng,
            itemClick: (Prediction prediction) {
              setState(() {
                widget.controller?.text = prediction.description ?? "";
                FocusManager.instance.primaryFocus?.unfocus();
              });
            },
            seperatedBuilder: const Divider(),
          ),
        ),
      ],
    );
  }
}

class ValidityDateFormatter extends TextInputFormatter {
  final String separator;

  ValidityDateFormatter({required this.separator});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var oldS = oldValue.text;
    var newS = newValue.text;
    var endsWithSeparator = false;

    if (newS.length > oldS.length) {
      for (var char in separator.characters) {
        if (kDebugMode) {
          print("new---${newS.length}");
        }
        if (newS.substring(0, newS.length - 1).endsWith(char)) {
          endsWithSeparator = true;
        }
      }
      print(
        'Ends with separator: $endsWithSeparator, so we will add it with next digit.',
      );

      var clean = newS.replaceAll(separator, '');
      print('CLEAN add: $clean');

      var isDigit = int.tryParse(newS.characters.last);
      if (isDigit == null) {
        return oldValue;
      }

      if (clean.length == 2) {
        var month = int.parse(clean.substring(0, 2));
        if (month > 12) {
          return oldValue;
        }
      }

      if (!endsWithSeparator && clean.length > 1 && clean.length % 2 == 1) {
        print('object $clean');

        return newValue.copyWith(
          text:
              newS.substring(0, newS.length - 1) +
              separator +
              newS.characters.last,
          selection: TextSelection.collapsed(
            offset: newValue.selection.end + separator.length,
          ),
        );
      }
    }

    if (newS.length < oldS.length) {
      for (var char in separator.characters) {
        if (oldS.substring(0, oldS.length - 1).endsWith(char)) {
          endsWithSeparator = true;
        }
      }
      print('Ends with separator: $endsWithSeparator, so we removed it');

      var clean = oldS.substring(0, oldS.length - 1).replaceAll(separator, '');
      print('CLEAN remove: $clean');
      if (endsWithSeparator && clean.isNotEmpty && clean.length % 2 == 0) {
        return newValue.copyWith(
          text: newS.substring(0, newS.length - separator.length),
          selection: TextSelection.collapsed(
            offset: newValue.selection.end - separator.length,
          ),
        );
      }
    }

    return newValue;
  }
}

class ValidityMothFormatter extends TextInputFormatter {
  final String separator;

  ValidityMothFormatter({required this.separator});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var oldS = oldValue.text;
    var newS = newValue.text;
    var endsWithSeparator = false;

    if (newS.length > oldS.length) {
      for (var char in separator.characters) {
        if (newS.substring(0, newS.length - 1).endsWith(char)) {
          endsWithSeparator = true;
        }
      }
      print(
        'Ends with separator: $endsWithSeparator, so we will add it with next digit.',
      );

      var clean = newS.replaceAll(separator, '');
      print('CLEAN add: $clean');

      var isDigit = int.tryParse(newS.characters.last);
      if (isDigit == null) {
        return oldValue;
      }

      if (clean.length == 2) {
        var month = int.parse(clean.substring(0, 2));
        if (month > 12) {
          return oldValue;
        }
      }

      if (!endsWithSeparator && clean.length > 1 && clean.length % 2 == 1) {
        print('object $clean');

        return newValue.copyWith(
          text:
              newS.substring(0, newS.length - 1) +
              separator +
              newS.characters.last,
          selection: TextSelection.collapsed(
            offset: newValue.selection.end + separator.length,
          ),
        );
      }
    }

    if (newS.length < oldS.length) {
      for (var char in separator.characters) {
        if (oldS.substring(0, oldS.length - 1).endsWith(char)) {
          endsWithSeparator = true;
        }
      }
      print('Ends with separator: $endsWithSeparator, so we removed it');

      var clean = oldS.substring(0, oldS.length - 1).replaceAll(separator, '');
      print('CLEAN remove: $clean');
      if (endsWithSeparator && clean.isNotEmpty && clean.length % 2 == 0) {
        return newValue.copyWith(
          text: newS.substring(0, newS.length - separator.length),
          selection: TextSelection.collapsed(
            offset: newValue.selection.end - separator.length,
          ),
        );
      }
    }

    return newValue;
  }
}
