import 'account_model.dart';

class Company extends Account {
  Company({
    required super.name,
    required super.email,
    super.profilePicture,
  });
}
