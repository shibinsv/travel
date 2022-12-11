part of 'tabs_bloc.dart';

@immutable
abstract class TabsEvent {}

class OnTabSelectedEvent extends TabsEvent {
  final int selectedTab;

  OnTabSelectedEvent(this.selectedTab);
}

class OnTabUnselectedEvent extends TabsEvent {}
