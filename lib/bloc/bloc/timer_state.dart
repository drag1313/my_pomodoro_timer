part of 'timer_bloc.dart';

@immutable
abstract class TimerState {}

class TimerInitialState extends TimerState {}

class CalendarState extends TimerState {}

class SettingsScreenState extends TimerState {}

class FullVersionScreenState extends TimerState {}

class PauseState extends TimerState {
  bool isPause = false;
}
