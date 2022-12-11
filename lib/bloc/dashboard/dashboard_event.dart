part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class DashboardLoadingEvent extends DashboardEvent {
 
}

class DashboardLoadedEvent extends DashboardEvent{

}
