// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../commom/emuns/bloc_status.dart';

class NewTicketState {
  BlocStatusState status;
  String? message;
  NewTicketState({
    required this.status,
    this.message,
  });

  NewTicketState copyWith({
    required BlocStatusState status,
    String? message,
  }) {
    return NewTicketState(
      status: status,
      message: message,
    );
  }
}
