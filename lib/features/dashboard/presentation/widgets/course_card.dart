import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';
import 'package:language_learning_ui/data/models/course_model.dart';
import 'package:language_learning_ui/features/favorites/cubit/favourites_cubit.dart';
import 'package:language_learning_ui/features/favorites/presentation/pages/course_details_page.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetailsPage(course: course),
          ),
        );
      },
      child: SizedBox(
        height: 120.0.h,
        width: 145.0.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: course.color,
                  borderRadius: BorderRadius.circular(8.0.r),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(course.image),
                    Positioned(
                      top: 8.0.h,
                      right: 8.0.w,
                      child: BlocBuilder<FavouritesCubit, FavouritesState>(
                        builder: (context, state) {
                          final isFavorite = state.favoriteCourses.any(
                            (c) => c.name == course.name,
                          );

                          return GestureDetector(
                            onTap: () {
                              context
                                  .read<FavouritesCubit>()
                                  .toggleFavorite(course);
                            },
                            child: Container(
                              padding: EdgeInsets.all(4.0.w),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.4),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.white,
                                size: 18.0.sp,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5.0.h),
            SizedBox(
              height: 40.0.h,
              child: Text(
                course.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColor.primaryTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
