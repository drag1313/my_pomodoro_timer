import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  int WorkTimeCounter = 0;
  int PomodoroCount = 0;
  int ShortBreakCount = 0;
  int ShortBreak = 5;
  int LongBreak = 25;
  int WorkTime = 4;
  bool isPausePress = false;
  bool isPause = false;
  bool isStop = false;
  late int durationTime = duration();

  int duration() {
    if (WorkTimeCounter < 2) {
      WorkTimeCounter++;
      durationTime = WorkTime;
      return durationTime;
    } else if (WorkTimeCounter == 2) {
      durationTime = ShortBreak;
      WorkTimeCounter++;
      return durationTime;
    }
    print(WorkTimeCounter);
    print(durationTime);
    return durationTime;
  }

  TimerBloc() : super(TimerInitialState()) {
    on<TimerEvent>((event, emit) {
      if (event is CalendarEvent) {
        emit(CalendarState());
      }
      if (event is FullVersionEvent) {
        emit(FullVersionScreenState());
      }
      if (event is SettingsEvent) {
        emit(SettingsScreenState());
      }
      if (event is PauseEvent) {
        emit(PauseState());
      }
    });
  }
}
