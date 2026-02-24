import 'all_imports.dart';

class AppTextField extends StatefulWidget {
  final String? title;
  final double? titleSpacing;
  final Color? titleColor;
  final Color? borderColor;
  final Color? focusBorderColor;
  final double? titleSize;
  final String? hintText;
  final String? counterText;
  final String? labelText;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Color? hintTextColor;
  final Color? textColor;
  final Color? cursorColor;
  final int? maxLines;
  final double? blurRadius;
  final int? minLines;
  final int? maxLength;
  final bool? readOnly;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? enabled;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final InputBorder? inputBorder;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final BoxConstraints? prefixIconConstraints;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final TextAlignVertical? textAlignVertical;
  final double? elevation;
  final double? hintSize;
  final double? fontSize;
  final FontWeight? hintWeight;
  final FontWeight? fontWeight;
  final String? hintFamily;
  final InputBorder? border;

  AppTextField({
    super.key,
    this.inputFormatters,
    this.hintText,
    this.obscureText,
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.hintTextColor,
    this.textColor,
    this.maxLines,
    this.minLines,
    this.readOnly,
    this.prefix,
    this.textInputAction,
    this.keyboardType,
    this.enabled,
    this.controller,
    this.onChanged,
    this.onTap,
    this.textCapitalization,
    this.maxLength,
    this.counterText,
    this.title,
    this.titleSpacing,
    this.titleColor,
    this.titleSize,
    this.focusBorderColor,
    this.cursorColor,
    this.validator,
    this.inputBorder,
    this.contentPadding,
    this.fillColor,
    this.prefixIconConstraints,
    this.borderRadius,
    this.margin,
    this.padding,
    this.textAlignVertical,
    this.elevation,
    this.blurRadius,
    this.hintSize,
    this.fontSize,
    this.hintWeight,
    this.fontWeight,
    this.labelText,
    this.hintFamily,
    this.border,
  });

  final regexToRemoveEmoji =
      r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';

  final vehicleRegistrationRegex = RegExp(r'^[A-Z]{2}\d{2}[A-Z]{2}\d{4}$');
  final vehicleNumberRegex = RegExp(r'^[A-Za-z]{2}\d{2}[A-Za-z]{3}$');
  final drivingLicenseRegex = RegExp(r'^[A-Za-z]{2}\d{6}$');

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
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
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!.tr,
            style: TextStyle(
              fontSize: widget.titleSize ?? 14,
              color: widget.titleColor ?? Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: widget.titleSpacing ?? 15),
        ],

        /// 2. The Text Field
        TextFormField(
          cursorColor: widget.cursorColor ?? AppColor.greyColor,
          focusNode: _focusNode,
          controller: widget.controller,
          obscureText: widget.obscureText ?? false,
          readOnly: widget.readOnly ?? false,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          maxLines: widget.maxLines ?? 1,
          style: TextStyle(
            color: widget.textColor ?? Colors.black,
            fontSize: widget.fontSize ?? 15,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText?.tr,
            hintStyle: TextStyle(
              color: widget.hintTextColor ?? Colors.grey.withValues(alpha: 0.6),
              fontSize: widget.hintSize ?? 15,
              fontWeight: widget.hintWeight ?? FontWeight.w400,
            ),
            fillColor: widget.fillColor ?? Colors.white,
            filled: true,

            // Border Logic
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
              borderSide: BorderSide(
                color: widget.borderColor ?? Colors.grey.shade300,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
              borderSide: BorderSide(
                color: widget.focusBorderColor ?? Colors.grey.shade400,
                width: 1.2,
              ),
            ),
            contentPadding:
                widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            prefixIcon: widget.prefixIcon != null
                ? IconTheme(
                    data: IconThemeData(
                      color: _focusNode.hasFocus
                          ? (widget.focusBorderColor ?? Colors.grey)
                          : (widget.borderColor ?? Colors.grey),
                    ),
                    child: widget.prefixIcon!,
                  )
                : null,

            suffixIcon: widget.suffixIcon != null
                ? IconTheme(
                    data: IconThemeData(
                      color: _focusNode.hasFocus
                          ? (widget.focusBorderColor ?? Colors.grey)
                          : (widget.borderColor ?? Colors.grey),
                    ),
                    child: widget.suffixIcon!,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
