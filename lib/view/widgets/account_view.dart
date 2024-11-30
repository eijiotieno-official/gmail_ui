import 'package:flutter/material.dart';
import 'package:gmail_ui/model/base/account_model.dart';

class AccountProfileView extends StatelessWidget {
  final Account account;
  final VoidCallback? onTap;
  const AccountProfileView({
    super.key,
    this.onTap,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const CircleAvatar(child: Icon(Icons.person_2_rounded)),
    );
  }
}
