part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class AddItem extends AppEvent {
  final String? keyy;

  AddItem({this.keyy});
}

class RemoveIndex extends AppEvent {
  final int indx;
  RemoveIndex({required this.indx});
}

class RemoveItem extends AppEvent {}
