part of 'travel_bloc.dart';

@immutable
abstract class TravelState {}

class TravelInitial extends TravelState{

}


class TravelImageUpdatedState extends TravelState {}

class TravelModeSelectedState extends TravelState {
  final int modeSelected;

  TravelModeSelectedState(this.modeSelected);
}
