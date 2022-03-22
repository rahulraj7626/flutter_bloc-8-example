import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AddItem>((event, emit) {
      List lt = state.list;
      lt.add(event.keyy);
      emit(AppState(list: lt));
    });
    on<RemoveItem>((event, emit) {
      emit(AppState(list: state.list.removeAt(0)));
    });
    on<RemoveIndex>((event, emit) {
      emit(AppState(list: state.list.removeAt(event.indx)));
    });
  }
}
