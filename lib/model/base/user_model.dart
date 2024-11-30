import 'account_model.dart';

class User extends Account {
  User({
    required super.name,
    required super.email,
    super.profilePicture,
  });
}
