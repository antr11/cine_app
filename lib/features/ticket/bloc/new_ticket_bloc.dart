import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../commom/emuns/bloc_status.dart';
import '../data/model/ticket_model.dart';
import '../domain/repository/new_ticket_repository_implement.dart';
import 'new_ticket_event.dart';
import 'new_ticket_state.dart';

class NewTicketBloc extends Bloc<NewTicketEvent, NewTicketState> {
  NewTicketBloc() : super(NewTicketState(status: BlocStatusState.initial)) {
    on<CreateNewTicketEvent>(_onGetNewTicketEvent);
  }

  final _repo = NewTicketRepositoryImplement();

  FutureOr<void> _onGetNewTicketEvent(
    CreateNewTicketEvent event,
    Emitter<NewTicketState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatusState.loading));
    try {
      final _ = _repo.createTicket(
        NewTicketModel.fromEntity(event.ticket),
      ); //entity -> model
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          message: 'Buy ticket successfully',
        ),
      );
      final getTickets = _repo.readTickets(
        userId: FirebaseAuth.instance.currentUser?.uid ?? '',
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatusState.failed,
          message: 'Failed to ticket',
        ),
      );
    }
  }
}
