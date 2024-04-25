import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../commom/emuns/bloc_status.dart';

import '../data/domain/repo/account_repository.dart';
import '../data/domain/repo/account_repostory_implement.dart';
import 'account_event.dart';
import 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountState(status: BlocStatusState.initial)) {
    on<GetAccountInfoEvent>(_onGetAccountInfoEvent);
    on<SetAccountInfoEvent>(_onSetAccountInfoEvent);
  }
  final AccountRepository _repo = AccountRepositoryImplement();

  FutureOr<void> _onGetAccountInfoEvent(
    GetAccountInfoEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatusState.loading));
    try {
      final account = await _repo.getAccountInfo(userId: event.userId);
      if (account != null) {
        emit(
          state.copyWith(
            status: BlocStatusState.success,
            account: account,
            successMessage: 'Get user success',
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: BlocStatusState.failed,
            // errorMessage: 'User not found',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatusState.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onSetAccountInfoEvent(
    SetAccountInfoEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatusState.loading));
    try {
      await _repo.setAccountInfo(event.entity);
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          successMessage: 'Update account successfully',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatusState.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
