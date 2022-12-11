part of 'saved_items_bloc.dart';

@immutable
abstract class SavedItemsState {}

class SavedItemsInitial extends SavedItemsState {}

class OnSaveItemState extends SavedItemsState {
  bool isSaved;
  OnSaveItemState(this.isSaved);
}

class ListRefreshedState extends SavedItemsState {

}
