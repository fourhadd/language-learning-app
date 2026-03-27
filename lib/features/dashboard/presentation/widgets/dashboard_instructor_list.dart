import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/constants/constants.dart';
import 'package:language_learning_ui/widgets/instructor_card.dart';

class DashboardInstructorList extends StatelessWidget {
  const DashboardInstructorList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(140.0),
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(width: 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: Constants.instructors.length,
        itemBuilder: (context, index) =>
            InstructorCard(instructor: Constants.instructors[index]),
      ),
    );
  }
}
