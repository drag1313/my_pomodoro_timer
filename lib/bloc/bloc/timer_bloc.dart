import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitialState()) {
    on<TimerEvent>((event, emit) {
      if (event is CalendarEvent) {
        emit(CalendarState());
      }
      if (event is FullVersionEvent) {
        emit(FullVersionScreenState());
      }
    });
  }
}
