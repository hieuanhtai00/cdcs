part of 'overview_bloc.dart';

@immutable
abstract class OverviewEvent {}

class HomeEvent extends OverviewEvent {}

class ToolsEvent extends OverviewEvent {}

class MeEvent extends OverviewEvent {}
