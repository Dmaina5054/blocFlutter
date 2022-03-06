import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'countercubit_state.dart';

class CountercubitCubit extends Cubit<CountercubitState> {
  //setting initial value
  CountercubitCubit() : super(CountercubitState(0));

  //implementing some functionality

  //increment behavior
  void increment() {
    emit(CountercubitState(state.counterValue + 1));
  }

  //decrement behavior
  void decrement() => emit(CountercubitState(state.counterValue - 1));

  //reset function
  void reset() => emit(CountercubitState(0));
}
