import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) {});

    on<DashboardLoadingEvent>(
        (event, emit) => emit(DashboardLoadingState()));

    on<DashboardLoadedEvent>((event, emit) => {emit(DashboardLoadedState())});
  }
}
