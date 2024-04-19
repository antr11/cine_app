import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/ticket_model.dart';
import 'new_ticket_local_datasource.dart';

class NewTicketLocalDatasourceSqfImplement extends NewTicketLocalDatasource {
  // Implement, SQFlite
  late Database _database;
  @override
  Future<void> initDB() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'vinemas.db'),
      onCreate: (db, version) {
        return db.execute('''
CREATE TABLE newTickets(
  id TEXT PRIMARY KEY,
  title TEXT,
  runTime REAL,
  filmFormat TEXT,
  theater TEXT,
  time TEXT,
  seats TEXT,
  unitPrice REAL,
  userId TEXT,
  createdAt TEXT)
''');
      },
      version: 1,
    );
  }

  @override
  Future<List<NewTicketModel>> readTickets({required String userId}) async {
    final result = await _database
        .query('newTickets', where: '$userId = ?', whereArgs: [userId]);
    final tickets = result.map(NewTicketModel.fromJson).toList();
    return tickets;
  }

  @override
  Future<void> createTicket(NewTicketModel ticket) async {
    await _database.insert('newTickets', ticket.toJson());
  }

  @override
  Future<NewTicketModel> updateTicket(NewTicketModel newTicket) {
    // TODO: implement updateTicket
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTicket(String ticketId) async {
    final numberOfResult = await _database
        .delete('newTickets', where: '$ticketId = ?', whereArgs: [ticketId]);
    print(numberOfResult);
  }

  @override
  void clearData() {
    // TODO: implement clearData
  }
}
