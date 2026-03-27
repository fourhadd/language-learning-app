part of 'dashboard_cubit.dart';

class DashboardState {
  final int selectedIndex;
  final bool isLoading;
  final String? errorMessage;

  DashboardState({
    required this.selectedIndex,
    this.isLoading = false,
    this.errorMessage,
  });

  DashboardState copyWith({
    int? selectedIndex,
    bool? isLoading,
    String? errorMessage,
  }) {
    return DashboardState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}


class DashboardInitial extends DashboardState {
  DashboardInitial() : super(selectedIndex: 0);
}
