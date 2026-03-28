part of 'dashboard_cubit.dart';

class DashboardState {
  final int selectedIndex;
  final bool isLoading;
  final bool isSearching;
  final List<CourseModel> displayedCourses;
  final List<InstructorModel> displayedInstructors;

  final List<CourseModel> favoriteCourses;

  DashboardState({
    this.selectedIndex = 0,
    this.isLoading = false,
    this.isSearching = false,
    this.displayedCourses = const [],
    this.displayedInstructors = const [],
    this.favoriteCourses = const [],
  });

  DashboardState copyWith({
    int? selectedIndex,
    bool? isLoading,
    bool? isSearching,
    List<CourseModel>? displayedCourses,
    List<InstructorModel>? displayedInstructors,
    List<CourseModel>? favoriteCourses,
  }) {
    return DashboardState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isLoading: isLoading ?? this.isLoading,
      isSearching: isSearching ?? this.isSearching,
      displayedCourses: displayedCourses ?? this.displayedCourses,
      displayedInstructors: displayedInstructors ?? this.displayedInstructors,
      favoriteCourses: favoriteCourses ?? this.favoriteCourses,
    );
  }
}

class DashboardInitial extends DashboardState {
  DashboardInitial()
      : super(
          displayedCourses: Constants.courses,
          displayedInstructors: Constants.instructors,
          favoriteCourses: [],
        );
}
