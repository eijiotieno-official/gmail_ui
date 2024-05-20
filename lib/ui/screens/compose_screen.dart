import 'package:flutter/material.dart';

class ComposeScreen extends StatefulWidget {
  const ComposeScreen({super.key});

  @override
  State<ComposeScreen> createState() => _ComposeScreenState();
}

class _ComposeScreenState extends State<ComposeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.attach_file_rounded,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.send_rounded,
            ),
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Schedule send"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Add from Contacts"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Confidential mode"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Save draft"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Discard"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Settings"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const Text("Help and feedback"),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
