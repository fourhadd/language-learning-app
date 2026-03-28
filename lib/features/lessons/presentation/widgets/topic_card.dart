import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';
import 'package:language_learning_ui/data/models/topic_model.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';
import 'package:language_learning_ui/features/lessons/presentation/pages/lesson_screen.dart';

class TopicCard extends StatelessWidget {
  final TopicModel topic;

  const TopicCard({
    super.key,
    required this.topic,
  });

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => LessonScreen(),
          ),
        );
      },
      child: Container(
        height: 136.0.h,
        width: 246.0.w,
        decoration: BoxDecoration(
          color: topic.color,
          borderRadius: BorderRadius.circular(8.0.r),
          boxShadow: topic.boxShadow,
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              topic.points,
                              style: TextStyle(
                                color: AppColor.primaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0.sp,
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
                      topic.topic,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0.sp,
                      ),
                    ),
                    Text(
                      "${lang.itTakes} ${topic.time}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0.sp,
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
                    image: AssetImage(topic.image),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
