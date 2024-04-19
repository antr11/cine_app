import 'package:flutter_bloc/flutter_bloc.dart';

import '../../emuns/bloc_status.dart';

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState(status: BlocStatusState.initial)) {
    on<ChangeLanguageAppEvent>(onChangeLanguageAppEvent);
  }
  Future<void> onChangeLanguageAppEvent(
    ChangeLanguageAppEvent event,
    Emitter<AppState> emit,
  ) async {
    emit(
      state.copyWith(
        status: BlocStatusState.success,
        locale: event.locale,
      ),
    );
  }
}
