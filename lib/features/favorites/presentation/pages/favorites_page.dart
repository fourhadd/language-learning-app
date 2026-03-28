import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/features/favorites/cubit/favourites_cubit.dart';
import 'package:language_learning_ui/features/dashboard/presentation/widgets/course_card.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        final favorites = state.favoriteCourses;
        if (favorites.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 64.sp,
                  color: Colors.grey.withValues(alpha: 0.5),
                ),
                SizedBox(height: 16.h),
                Text(
                  lang.noFavoritesYet,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }

        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.0.h),
                Text(
                  lang.favoriteCourses,
                  style: TextStyle(
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(38, 50, 98, 1),
                  ),
                ),
                SizedBox(height: 20.0.h),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.only(bottom: 20.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.0.w,
                      mainAxisSpacing: 20.0.h,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      return CourseCard(course: favorites[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
