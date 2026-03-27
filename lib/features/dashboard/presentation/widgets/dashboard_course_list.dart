import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/constants/constants.dart';
import 'package:language_learning_ui/widgets/course_card.dart';

class DashboardCourseList extends StatelessWidget {
  const DashboardCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(167.0),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: Constants.courses.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 10.0);
        },
        itemBuilder: (BuildContext context, int index) {
          return CourseCard(
            course: Constants.courses[index],
          );
        },
      ),
    );
  }
}
