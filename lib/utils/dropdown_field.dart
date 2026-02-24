import 'all_imports.dart';

class DropdownField<T> extends StatefulWidget {
  final Rx<T> selectedValue;
  final String? title;
  final double? titleSpacing;
  final Color? titleColor;
  final Color? borderColor;
  final Color? focusBorderColor;
  final double? titleSize;
  final String? hintText;
  final String? counterText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? hintTextColor;
  final Color? textColor;
  final double? blurRadius;
  final String? Function(String)? validator;
  final VoidCallback? onChanged;
  final Function()? onTap;
  final InputBorder? inputBorder;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final BoxConstraints? prefixIconConstraints;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final double? hintSize;
  final double? fontSize;
  final FontWeight? hintWeight;
  final FontWeight? fontWeight;
  final bool? isBoxShadow;
  final List<DropdownMenuItem<String>> Function(String) items;

  const DropdownField(
      {super.key,
      required this.selectedValue,
      this.hintText,
      this.borderColor,
      this.prefixIcon,
      this.suffixIcon,
      this.hintTextColor,
      this.textColor,
      this.onChanged,
      this.onTap,
      this.counterText,
      this.title,
      this.titleSpacing,
      this.titleColor,
      this.titleSize,
      this.focusBorderColor,
      this.validator,
      this.inputBorder,
      this.contentPadding,
      this.fillColor,
      this.prefixIconConstraints,
      this.borderRadius,
      this.margin,
      this.padding,
      this.elevation,
      this.blurRadius,
      this.hintSize,
      this.fontSize,
      this.hintWeight,
      this.fontWeight,
      this.isBoxShadow,
      required this.items});

  @override
  State<DropdownField> createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
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
    _focusNode.dispose();
    super.dispose();
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
          padding: widget.padding ??
              const EdgeInsets.only(left: 7, right: 15, top: 0, bottom: 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
            boxShadow: widget.isBoxShadow == true
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha:0.1),
                      offset: const Offset(0, 0),
                      blurRadius: widget.blurRadius ?? 5,
                    )
                  ]
                : [],
          ),
          child: DropdownButtonFormField(
            icon: const SizedBox.shrink(),
            value: widget.selectedValue.value,
            elevation: 2,
            dropdownColor: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(10),
            alignment: AlignmentDirectional.centerStart,
            focusNode: _focusNode,
            onTap: widget.onTap,
            onChanged: (value) {
              widget.selectedValue.value = value;
              widget.onChanged?.call();
            },
            hint: AppText(
              text: widget.hintText ?? "",
              color: widget.hintTextColor ?? Colors.black.withValues(alpha:0.5),
              fontWeight: widget.hintWeight ?? FontWeight.w400,
              textSize: widget.hintSize ?? 15,
            ),
            autofocus: false,
            decoration: InputDecoration(
              counterText: widget.counterText,
              fillColor: Colors.transparent,
              filled: true,
              border: InputBorder.none,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon ??
                  const Icon(Icons.arrow_drop_down_outlined),
              suffixIconConstraints:
                  const BoxConstraints(minWidth: 15, maxWidth: 20),
              // contentPadding: widget.contentPadding ??
              //     const EdgeInsets.only(left: 20, right: 10, top: 0, bottom: 0),
            ),
            items: widget.items(widget.selectedValue.value ?? ''),
          ),
        )
      ],
    );
  }
}
