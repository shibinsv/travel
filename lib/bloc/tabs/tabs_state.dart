part of 'tabs_bloc.dart';

@immutable
abstract class TabsState {}

class TabsInitial extends TabsState {}

class OnTabSelectedState extends TabsState {
  final int selectedTab;
  OnTabSelectedState(this.selectedTab);
}
