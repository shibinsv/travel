import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'travel_event.dart';
part 'travel_state.dart';

class TravelBloc extends Bloc<TravelEvent, TravelState> {
  TravelBloc() : super(TravelInitial()) {
    on<TravelImageUpdatedEvent>(
        (event, emit) => emit(TravelImageUpdatedState()));

    on<TravelModeSelectedEvent>(
        (event, emit) => emit(TravelModeSelectedState(event.modeSelected)));
  }
}
