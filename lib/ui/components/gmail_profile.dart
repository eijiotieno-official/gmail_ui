import 'package:flutter/material.dart';

class GmailProfile extends StatelessWidget {
  const GmailProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person_2_rounded),
        ),
      ),
    );
  }
}
