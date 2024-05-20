import 'package:flutter/material.dart';

class GmailProfile extends StatelessWidget {
  final VoidCallback? onTap;
  const GmailProfile({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const CircleAvatar(child: Icon(Icons.person_2_rounded)),
    );
  }
}
