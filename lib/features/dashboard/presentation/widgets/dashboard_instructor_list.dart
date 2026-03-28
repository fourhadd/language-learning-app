import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:language_learning_ui/features/lessons/presentation/widgets/instructor_card.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class DashboardInstructorList extends StatelessWidget {
  const DashboardInstructorList({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state.displayedInstructors.isEmpty) {
          return SizedBox(
            height: 140.0.h,
            child: Center(
              child: Text(
                lang.noInstructorsFound,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          );
        }
        return SizedBox(
          height: 140.0.h,
          child: ListView.separated(
            separatorBuilder: (_, __) => SizedBox(width: 10.0.w),
            scrollDirection: Axis.horizontal,
            itemCount: state.displayedInstructors.length,
            itemBuilder: (context, index) => InstructorCard(
              instructor: state.displayedInstructors[index],
            ),
          ),
        );
      },
    );
  }
}
