import 'package:bloc/bloc.dart';

part 'counter_bloc_state.dart';

class CounterBlocCubit extends Cubit<Counterstate> {
  CounterBlocCubit() : super(Counterstate(counterValue: 0));

  void increment() => emit(Counterstate(counterValue: state.counterValue++));
  void decrement() => emit(Counterstate(counterValue: state.counterValue--));
}
