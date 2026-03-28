import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:language_learning_ui/features/dashboard/presentation/widgets/course_card.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class DashboardCourseList extends StatelessWidget {
  const DashboardCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state.displayedCourses.isEmpty) {
          return SizedBox(
            height: 167.0.h,
            child: Center(
              child: Text(
                lang.noCoursesFound,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          );
        }

        return SizedBox(
          height: 167.0.h,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: state.displayedCourses.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 10.0.w);
            },
            itemBuilder: (BuildContext context, int index) {
              return CourseCard(
                course: state.displayedCourses[index],
              );
            },
          ),
        );
      },
    );
  }
}
