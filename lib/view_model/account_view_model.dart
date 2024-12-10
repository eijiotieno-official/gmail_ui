import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/base/account_model.dart';
import '../model/base/user_model.dart';
import '../model/repositories/account_repository.dart';

// Repository instance to fetch account-related data
final AccountRepository _accountRepository = AccountRepository();

// Provider for accessing the list of all accounts
final accountsProvider = Provider<List<Account>>((ref) {
  // Fetch the list of accounts from the repository
  return _accountRepository.accounts;
});

// Provider for accessing the current user account
final currentUserAccountProvider = Provider<User>((ref) {
  // Fetch the current user from the repository
  return _accountRepository.currentUser;
});
