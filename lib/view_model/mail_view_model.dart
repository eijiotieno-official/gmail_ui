import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/base/mail_model.dart';
import '../model/repositories/mail_repository.dart';

// ViewModel to manage state related to mail fetching
class MailViewModel extends StateNotifier<AsyncValue<List<Mail>>> {
  final MailRepository _repository;

  // Constructor initializes the state as loading and fetches the mails
  MailViewModel(this._repository) : super(AsyncValue.loading()) {
    _getMails();
  }

  // Private method to fetch mails asynchronously
  Future<void> _getMails() async {
    try {
      // Simulate a network delay (this should be removed in production)
      await Future.delayed(const Duration(seconds: 3));

      // Fetch the mails using the repository
      final results = _repository.fetch();

      // Update state with the fetched data
      state = AsyncValue.data(results);
    } catch (error) {
      // In case of an error, update the state with error data
      state = AsyncValue.error(error, StackTrace.current);
    }
  }
}

// Provider for MailViewModel, which provides mail data
final mailProvider =
    StateNotifierProvider<MailViewModel, AsyncValue<List<Mail>>>((ref) {
  final repository = MailRepository(); // Create repository instance
  return MailViewModel(repository); // Return an instance of MailViewModel
});

// Provider for keeping track of the opened mail
final openedMailProvider = StateProvider<Mail?>((ref) {
  return null; // Default value: no mail is opened
});
