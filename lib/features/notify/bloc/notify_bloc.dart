import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notify_event.dart';
part 'notify_state.dart';

class NotifyBloc extends Bloc<NotifyEvent, NotifyState> {
  NotifyBloc() : super(NotifyInitial()) {
    on<NotifyEvent>((event, emit) {});
  }
}
