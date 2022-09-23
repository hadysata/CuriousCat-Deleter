import 'package:curiouscat_deleter/app/core/animations/animations/bounce.dart';
import 'package:curiouscat_deleter/app/core/utils/constants.dart';
import 'package:flutter/material.dart';

/// A custom button to be used across the apps
class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final String? text;
  final Widget? child;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double fontSize;
  final EdgeInsetsGeometry? padding;

  const CustomButton(
      {Key? key,
      this.fontSize = 20,
      this.textColor = AppColors.string1,
      this.borderColor = Colors.transparent,
      this.child,
      this.height = 6.5,
      this.width = 200,
      this.text,
      this.onPressed,
      this.backgroundColor = AppColors.blue,
      this.padding})
      : // The user should provide a String text or a child
        assert((child == null || text == null) && (child != null || text != null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounce(
        onTap: onPressed,
        child: Container(
          height: height.h,
          width: width.w,
          decoration: BoxDecoration(
              border: Border.all(width: 2.sp, color: borderColor),
              color: backgroundColor,
              borderRadius: DesignConstants.borderRadius50),
          child: Center(
            child: child ??
                Text(
                  text!,
                ),
          ),
        ));
  }
}
