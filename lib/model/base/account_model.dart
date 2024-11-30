class Account {
  final String name;
  final String email;
  final String? profilePicture;
  Account({
    required this.name,
    required this.email,
    this.profilePicture,
  });

  static Account currentUser() =>
      Account(name: "Eiji", email: "email@gmail.com");
}
