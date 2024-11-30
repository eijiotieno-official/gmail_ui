import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/base/mail_model.dart';
import '../model/repositories/mail_repository.dart';

class MailViewModel extends StateNotifier<AsyncValue<List<Mail>>> {
  final MailRepository _repository;

  MailViewModel(this._repository) : super(AsyncValue.loading()) {
    _getMails();
  }

  Future<void> _getMails() async {
    await Future.delayed(const Duration(seconds: 3));

    final results = _repository.fetch();

    state = AsyncValue.data(results);
  }
}

final mailProvider =
    StateNotifierProvider<MailViewModel, AsyncValue<List<Mail>>>((ref) {
  MailRepository repository = MailRepository();
  return MailViewModel(repository);
});
