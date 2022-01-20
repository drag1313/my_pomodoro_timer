part of 'timer_bloc.dart';

@immutable
abstract class TimerEvent {}

class TimerInitialEvent extends TimerEvent {}

class CalendarEvent extends TimerEvent {}

class SettingsEvent extends TimerEvent {}

class FullVersionEvent extends TimerEvent {}

class PauseEvent extends TimerEvent {
  bool isPause = false;
}
