import 'package:curiouscat_deleter/app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    Key? key,
    required this.iconBackgroundColor,
    required this.icon,
  }) : super(key: key);

  final Color iconBackgroundColor;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: DesignConstants.containerCircularDecoration.copyWith(color: iconBackgroundColor),
      height: 4.5.h,
      width: 4.5.h,
      child: icon,
    );
  }
}