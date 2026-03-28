import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/data/models/course_model.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class CourseDetailsPage extends StatelessWidget {
  final CourseModel course;

  CourseDetailsPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: course.color,
        elevation: 0,
        title: Text(lang.courseDetails),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250.h,
              color: course.color,
              child: Image.asset(course.image),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.name,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    lang.aboutCourse,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
