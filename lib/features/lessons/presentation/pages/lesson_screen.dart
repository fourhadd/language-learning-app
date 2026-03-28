import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';
import 'package:language_learning_ui/data/models/lesson_model.dart';
import 'package:language_learning_ui/core/common/bottom_bar.dart';
import 'package:language_learning_ui/features/lessons/presentation/widgets/lesson_card.dart';
import 'package:language_learning_ui/features/dashboard/presentation/widgets/user_menu_bar.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    final lessons = LessonModel.lessons;

    return Scaffold(
      bottomNavigationBar: BottomBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 30.0.h),
                UserMenuBar(),
                SizedBox(height: 15.0.h),
                Container(
                  height: 190.0.h,
                  width: 339.0.w,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(8.0.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.primaryLightColor,
                        spreadRadius: 0,
                        blurRadius: 6.r,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 30.0.w,
                                    height: 30.0.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "20",
                                        style: TextStyle(
                                          color: AppColor.primaryTextColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.0.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.0.w),
                                  Text(
                                    lang.points,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0.sp,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                lang.dailyEnglishConversation,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.0.sp,
                                ),
                              ),
                              Text(
                                lang.learnMore,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/course-1.png"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30.0.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      lang.myLessons,
                      style: TextStyle(
                        fontSize: 21.0.sp,
                        color: AppColor.primaryTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      lang.viewAll,
                      style: TextStyle(
                        fontSize: 15.0.sp,
                        color: AppColor.captionTextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.0.h),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: lessons.length,
                    itemBuilder: (BuildContext context, int index) {
                      return LessonCard(lesson: lessons[index]);
                    },
                  ),
                ),
                SizedBox(height: 20.0.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
