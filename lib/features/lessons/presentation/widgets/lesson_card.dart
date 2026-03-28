import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';
import 'package:language_learning_ui/data/models/lesson_model.dart';

class LessonCard extends StatelessWidget {
  final LessonModel lesson;

  const LessonCard({
    super.key,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0.h),
        padding: EdgeInsets.all(6.0.w),
        width: double.infinity,
        height: 65.0.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0.r),
          boxShadow: [
            BoxShadow(
              // Modern rəng metodu
              color: Color.fromRGBO(169, 176, 185, 1).withValues(alpha: 0.42),
              spreadRadius: 0,
              blurRadius: 8.r,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 55.0.h,
              width: 55.0.w,
              decoration: BoxDecoration(
                color: Color.fromRGBO(224, 230, 255, 1),
                borderRadius: BorderRadius.circular(4.0.r),
              ),
              child: Image.asset(lesson.imagePath),
            ),
            SizedBox(width: 25.0.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColor.primaryTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0.sp,
                    ),
                  ),
                  SizedBox(height: 5.0.h),
                  Text(
                    lesson.duration,
                    style: TextStyle(
                      fontSize: 14.0.sp,
                      color: AppColor.captionTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.play_circle_fill,
              color: AppColor.primaryColor,
              size: 26.sp,
            ),
            SizedBox(width: 15.0.w)
          ],
        ),
      ),
    );
  }
}
