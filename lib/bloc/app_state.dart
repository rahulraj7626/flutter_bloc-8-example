part of 'app_bloc.dart';

class AppState {
  List list;
  AppState({required this.list});
}

class AppInitial extends AppState {
  AppInitial() : super(list: []);
}
