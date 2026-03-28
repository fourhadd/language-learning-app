import 'package:bloc/bloc.dart';
import 'package:language_learning_ui/core/constants/constants.dart';
import 'package:language_learning_ui/data/models/course_model.dart';
import 'package:language_learning_ui/data/models/instructor_model.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit()
      : super(DashboardState(
          selectedIndex: 0,
          isSearching: false,
          isLoading: false,
          displayedCourses: Constants.courses,
          displayedInstructors: Constants.instructors,
        ));

  void changePage(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void resetDashboard() {
    emit(DashboardState(
      selectedIndex: 0,
      isSearching: false,
      isLoading: false,
      displayedCourses: Constants.courses,
      displayedInstructors: Constants.instructors,
    ));
  }

  void startLoading() {
    emit(state.copyWith(isLoading: true));
  }

  void startSearch() {
    emit(state.copyWith(
      isSearching: true,
      displayedCourses: [],
      displayedInstructors: [],
    ));
  }

  void stopSearch() {
    emit(state.copyWith(
      isSearching: false,
      displayedCourses: Constants.courses,
      displayedInstructors: Constants.instructors,
    ));
  }

  void searchAll(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(
          displayedCourses: Constants.courses,
          displayedInstructors: Constants.instructors));
    } else {
      final filteredCourses = Constants.courses
          .where((course) =>
              course.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      final filteredInstructors = Constants.instructors
          .where((instructor) =>
              instructor.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      emit(state.copyWith(
        displayedCourses: filteredCourses,
        displayedInstructors: filteredInstructors,
      ));
    }
  }
}
