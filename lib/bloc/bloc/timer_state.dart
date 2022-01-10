part of 'timer_bloc.dart';

@immutable
abstract class TimerState {}

class TimerInitialState extends TimerState {}

class CalendarState extends TimerState {}

class FullVersionScreenState extends TimerState {}
