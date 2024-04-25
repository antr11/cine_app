import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/account_model.dart';
import 'account_datasource.dart';

class AccountDatasourceImplement extends AccountDatasource {
  @override
  Future<AccountModel?> getAccountInfo(String userId) async {
    // FirebaseAuth.instance.currentUser.uid (đã đăng nhập)
    final db = FirebaseFirestore.instance;
    final accountRef = db.collection('accounts');
    final query = accountRef.where('user_id', isEqualTo: userId);
    final result = await query.get();
    final data = result.docs.firstOrNull?.data(); // json
    return data == null ? null : AccountModel.fromJson(data);
  }

  @override
  Future<void> setAccountInfo(AccountModel accountModel) async {
    final db = FirebaseFirestore.instance;
    final accountRef = db.collection('accounts');
    final docRef = accountRef
        .withConverter(
          fromFirestore: (snapshot, options) {
            final data = snapshot.data();
            if (data == null) {
              return null;
            }
            return AccountModel.fromJson(data);
          },
          toFirestore: (account, options) =>
              account?.toJson() ?? <String, Object?>{},
        )
        .doc(accountModel.email);
    return docRef.set(accountModel);
  }
}
