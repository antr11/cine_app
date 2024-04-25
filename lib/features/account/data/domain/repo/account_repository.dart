import '../entities/account_entity.dart';

abstract class AccountRepository {
  // Get user from Firestore
  Future<AccountEntity?> getAccountInfo({required String userId});
  // Set user to Firestore
  Future<void> setAccountInfo(AccountEntity accountEntity);
}
