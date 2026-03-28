import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';
import 'package:language_learning_ui/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:language_learning_ui/features/dashboard/presentation/widgets/dashboard_course_level.dart';
import 'package:language_learning_ui/features/dashboard/presentation/widgets/dashboard_course_list.dart';
import 'package:language_learning_ui/features/dashboard/presentation/widgets/dashboard_instructor_list.dart';
import 'package:language_learning_ui/features/dashboard/presentation/widgets/dashboard_section_title.dart';
import 'package:language_learning_ui/features/favorites/presentation/pages/favorites_page.dart';
import 'package:language_learning_ui/features/profile/presentation/pages/profile_page.dart';
import 'package:language_learning_ui/core/common/border_text_field.dart';
import 'package:language_learning_ui/features/lessons/presentation/widgets/topics_list.dart';
import 'package:language_learning_ui/features/dashboard/presentation/widgets/user_menu_bar.dart';
import 'package:language_learning_ui/l10n/app_localizations.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.selectedIndex,
            onTap: (index) {
              context.read<DashboardCubit>().changePage(index);
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            unselectedIconTheme: IconThemeData(
              color: Color.fromRGBO(202, 205, 219, 1),
            ),
            selectedIconTheme: IconThemeData(
              color: AppColor.primaryColor,
            ),
            items: [
              BottomNavigationBarItem(
                  label: "", icon: Icon(Icons.home_outlined)),
              BottomNavigationBarItem(
                  label: "", icon: Icon(Icons.calendar_today_outlined)),
              BottomNavigationBarItem(
                  label: "", icon: Icon(Icons.favorite_outline)),
              BottomNavigationBarItem(
                  label: "", icon: Icon(Icons.edit_outlined)),
              BottomNavigationBarItem(
                  label: "", icon: Icon(Icons.person_outline)),
            ],
          ),
          body: IndexedStack(
            index: state.selectedIndex,
            children: [
              SingleChildScrollView(
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
                        BorderTextField(
                          controller: _searchController,
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          suffixIcon: state.isSearching
                              ? IconButton(
                                  icon: Icon(Icons.close, color: Colors.red),
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    _searchController.clear();
                                    context.read<DashboardCubit>().stopSearch();
                                  },
                                )
                              : null,
                          borderRadius: 50.0.r,
                          hintText: lang.searchHint,
                          onTap: () {
                            context.read<DashboardCubit>().startSearch();
                          },
                          onChanged: (value) {
                            context.read<DashboardCubit>().searchAll(value);
                          },
                        ),
                        if (!state.isSearching) ...[
                          SizedBox(height: 30.0.h),
                          TopicsList(),
                          SizedBox(height: 30.0.h),
                          DashboardSectionTitle(title: lang.popularCourses),
                          SizedBox(height: 12.0.h),
                          DashboardCourseLevels(),
                          SizedBox(height: 20.0.h),
                        ],
                        if (state.isSearching) ...[
                          SizedBox(height: 20.0.h),
                          DashboardSectionTitle(
                              title: lang.coursesFound, showViewAll: false),
                          SizedBox(height: 10.0.h),
                        ],
                        DashboardCourseList(),
                        SizedBox(height: 20.0.h),
                        DashboardSectionTitle(
                            title: state.isSearching
                                ? lang.instructorsFound
                                : lang.instructors,
                            showViewAll: false),
                        SizedBox(height: 10.0.h),
                        DashboardInstructorList(),
                        SizedBox(height: 20.0.h),
                      ],
                    ),
                  ),
                ),
              ),
              Center(child: Text(lang.calendarPage)),
              FavoritesPage(),
              Center(child: Text(lang.editNotesPage)),
              ProfilePage(),
            ],
          ),
        );
      },
    );
  }
}
