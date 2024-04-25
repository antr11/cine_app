import '../../datascource/account_datasource.dart';
import '../../datascource/account_datasource_implement.dart';
import '../../models/account_model.dart';
import '../entities/account_entity.dart';
import 'account_repository.dart';

class AccountRepositoryImplement extends AccountRepository {
  final AccountDatasource _datasource = AccountDatasourceImplement();
  @override
  Future<AccountEntity?> getAccountInfo({required String userId}) async {
    final model = await _datasource.getAccountInfo(userId);
    // Converter
    return model?.toEntity();
  }

  @override
  Future<void> setAccountInfo(AccountEntity accountEntity) async {
    final model = AccountModel.fromEntity(accountEntity);
    await _datasource.setAccountInfo(model);
  }
}
