import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'saved_items_event.dart';
part 'saved_items_state.dart';

class SavedItemsBloc extends Bloc<SavedItemsEvent, SavedItemsState> {
  SavedItemsBloc() : super(SavedItemsInitial()) {
    on<OnSaveItemEvent>((event, emit) => emit(OnSaveItemState(event.isSaved)));
    on<ListRefreshedEvent>((event, emit) => emit(ListRefreshedState()));
  }
}
