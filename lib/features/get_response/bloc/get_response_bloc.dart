import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_response_event.dart';
part 'get_response_state.dart';

class GetResponseBloc extends Bloc<GetResponseEvent, GetResponseState> {
  GetResponseBloc() : super(GetResponseInitial()) {
    on<GetResponseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
