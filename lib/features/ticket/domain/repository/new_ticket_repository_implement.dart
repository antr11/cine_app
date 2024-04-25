import 'package:cine_app/main.dart';

import '../../data/local/new_ticket_local_datasource_sqf_implement.dart';
import '../../data/model/ticket_model.dart';

import 'new_ticket_repository.dart';

class NewTicketRepositoryImplement extends NewTicketRepository {
  final _datasource = newTicketDatasource; // use global object
  @override
  Future<void> createTicket(NewTicketModel ticket) {
    return _datasource.createTicket(ticket);
  }

  @override
  Future<void> delete({required String ticketId}) {
    return _datasource.deleteTicket(ticketId);
  }

  @override
  Future<List<NewTicketModel>> readTickets({required String userId}) {
    return _datasource.readTickets(userId: userId);
  }

  @override
  Future<NewTicketModel> updateTicket(NewTicketModel newTicket) {
    return _datasource.updateTicket(newTicket);
  }
}
