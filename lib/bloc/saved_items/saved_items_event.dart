part of 'saved_items_bloc.dart';

@immutable
abstract class SavedItemsEvent {}

class OnSaveItemEvent extends SavedItemsEvent {
  bool isSaved;
  OnSaveItemEvent(this.isSaved);
}

class ListRefreshedEvent extends SavedItemsEvent{}