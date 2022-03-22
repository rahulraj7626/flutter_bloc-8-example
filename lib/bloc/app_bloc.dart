import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    // on<CounterBlocEvent>(
    //  (event, emit) {
    // if (event is Increement) {
    //   emit(CounterBlocState(counterValue: state.counterValue.));
    // }if (event is Decreement) {
    //   emit(CounterBlocState(counterValue: state.counterValue =state.counterValue.removeLast()));
    // }
    //  },
    // );

    on<AddItem>((event, emit) {
      List lt = state.list;
      lt.add(event.keyy);

      emit(AppState(list: lt));
    });
    on<RemoveItem>((event, emit) {
      List lt = state.list;

      lt.removeAt(0);

      emit(AppState(list: lt));
    });
    on<RemoveIndex>((event, emit) {
      List lt = state.list;

      lt.removeAt(event.indx);

      emit(AppState(list: lt));
    });
  }
}
