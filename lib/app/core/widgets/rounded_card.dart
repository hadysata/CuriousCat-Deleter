import 'package:countup/countup.dart';
import 'package:curiouscat_deleter/app/core/utils/constants.dart';
import 'package:curiouscat_deleter/app/core/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {
  final String title;
  final String value;
  final Color iconBackgroundColor;
  final Widget icon;
  const RoundedCard({
    Key? key,
    required this.title,
    required this.value,
    this.iconBackgroundColor = AppColors.red,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: DesignConstants.containerDecoration,
      height: 19.h,
      width: 42.w,
      child: Padding(
        padding: EdgeInsets.all(6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppIcon(iconBackgroundColor: iconBackgroundColor, icon: icon),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(color: AppColors.string2, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 1.h),
            if (double.tryParse(value) != null)
              Countup(
                begin: 0,
                end: double.tryParse(value)!,
                duration: const Duration(seconds: 1),
                separator: ',',
              ),
            if (double.tryParse(value) == null) Text(value)
          ],
        ),
      ),
    );
  }
}
