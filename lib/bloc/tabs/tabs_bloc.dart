import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tabs_event.dart';
part 'tabs_state.dart';

class TabsBloc extends Bloc<TabsEvent, TabsState> {
  TabsBloc() : super(TabsInitial()) {
    on<TabsEvent>((event, emit) {});
    on<OnTabSelectedEvent>(
        (event, emit) => emit(OnTabSelectedState(event.selectedTab)));
  }
}
