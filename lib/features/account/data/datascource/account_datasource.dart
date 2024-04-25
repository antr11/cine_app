import '../models/account_model.dart';

abstract class AccountDatasource {
  Future<AccountModel?> getAccountInfo(String userId);
  Future<void> setAccountInfo(AccountModel accountModel);
}
