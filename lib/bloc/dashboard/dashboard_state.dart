part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoadingState extends DashboardState {
  
}

class DashboardLoadedState extends DashboardState {}
