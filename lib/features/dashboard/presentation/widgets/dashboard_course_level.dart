import 'package:flutter/material.dart';
import 'package:language_learning_ui/core/constants/constants.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';

class DashboardCourseLevels extends StatelessWidget {
  const DashboardCourseLevels({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22.0,
      child: ListView.separated(
        separatorBuilder: (_, __) => SizedBox(width: 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: Constants.courseLevels.length,
        itemBuilder: (context, index) {
          return Text(
            Constants.courseLevels[index],
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: index == 0 ? FontWeight.w600 : FontWeight.w400,
              color: index == 0
                  ? AppColor.primaryColor
                  : AppColor.captionTextColor,
            ),
          );
        },
      ),
    );
  }
}
