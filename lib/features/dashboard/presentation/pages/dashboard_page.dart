import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning_ui/core/constants/constants.dart';
import 'package:language_learning_ui/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:language_learning_ui/features/dashboard/presentation/widgets/dashboard_course_level.dart';
import 'package:language_learning_ui/features/dashboard/presentation/widgets/dashboard_course_list.dart';
import 'package:language_learning_ui/features/dashboard/presentation/widgets/dashboard_instructor_list.dart';
import 'package:language_learning_ui/features/dashboard/presentation/widgets/dashboard_section_title.dart';
import 'package:language_learning_ui/features/profile/presentation/pages/profile_page.dart';

import 'package:language_learning_ui/widgets/border_text_field.dart';
import 'package:language_learning_ui/widgets/topics_list.dart';
import 'package:language_learning_ui/features/dashboard/presentation/widgets/user_menu_bar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
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
            unselectedIconTheme: const IconThemeData(
              color: Color.fromRGBO(202, 205, 219, 1),
            ),
            selectedIconTheme: const IconThemeData(
              color: Constants.primaryColor,
            ),
            items: const [
              BottomNavigationBarItem(
                  label: "", icon: Icon(Icons.home_outlined)),
              BottomNavigationBarItem(
                  label: "", icon: Icon(Icons.calendar_today_outlined)),
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
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 30.0),
                        UserMenuBar(),
                        const SizedBox(height: 15.0),
                        const BorderTextField(
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          borderRadius: 50.0,
                          hintText: "Search...",
                        ),
                        const SizedBox(height: 30.0),
                        TopicsList(),
                        const SizedBox(height: 30.0),
                        DashboardSectionTitle(title: "Popular Courses"),
                        const SizedBox(height: 12.0),
                        DashboardCourseLevels(),
                        const SizedBox(height: 20.0),
                        DashboardCourseList(),
                        const SizedBox(height: 20.0),
                        DashboardSectionTitle(
                            title: "Instructors", showViewAll: false),
                        const SizedBox(height: 10.0),
                        DashboardInstructorList(),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
              ),

              // INDEX 1: CALENDAR
              const Center(child: Text("Calendar Page")),

              // INDEX 2: EDIT
              const Center(child: Text("Edit/Notes Page")),

              // INDEX 3: PROFILE
              const ProfilePage(),
            ],
          ),
        );
      },
    );
  }
}
