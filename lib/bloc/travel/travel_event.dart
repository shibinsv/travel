part of 'travel_bloc.dart';

@immutable
abstract class TravelEvent {}

class TravelInitialEvent extends TravelEvent {
  int initialState;
  TravelInitialEvent(this.initialState);
}

class TravelImageUpdatedEvent extends TravelEvent {}

class TravelModeSelectedEvent extends TravelEvent {
  final int modeSelected;

  TravelModeSelectedEvent(this.modeSelected);
}
