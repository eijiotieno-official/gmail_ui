import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/base/account_model.dart';
import '../model/base/user_model.dart';
import '../model/repositories/account_repository.dart';

AccountRepository _accountRepository = AccountRepository();

final accountsProvider = Provider<List<Account>>((ref) {
  return _accountRepository.accounts;
});

final currentUserAccountProvider = Provider<User>((ref) {
  return _accountRepository.currentUser;
});
