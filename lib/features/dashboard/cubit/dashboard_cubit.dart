import 'package:bloc/bloc.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  void changePage(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void startLoading() {
    emit(state.copyWith(isLoading: true));
  }
}
