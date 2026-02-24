import 'package:flutter/material.dart';
import 'package:ighty_support/generated/assets.dart';

class CommanScaffold extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final String? backgroundImage;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const CommanScaffold({
    super.key,
    required this.child,
    this.backgroundColor,
    this.backgroundImage = Assets.imagesBackgroundImage,
    this.width,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height, // ✅ FIX
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        image: backgroundColor == null
            ? DecorationImage(
                image: AssetImage(
                  backgroundImage ?? Assets.imagesBackgroundImage,
                ),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: child,
    );
  }
}
