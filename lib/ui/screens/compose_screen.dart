import 'package:flutter/material.dart';
import 'package:gmail_ui/ui/components/compose_components/body_section.dart';
import 'package:gmail_ui/ui/components/compose_components/from_section.dart';
import 'package:gmail_ui/ui/components/compose_components/subject_section.dart';
import 'package:gmail_ui/ui/components/compose_components/to_section.dart';

class ComposeScreen extends StatefulWidget {
  const ComposeScreen({super.key});

  @override
  State<ComposeScreen> createState() => _ComposeScreenState();
}

class _ComposeScreenState extends State<ComposeScreen> {
  TextEditingController _fromController = TextEditingController();

  bool _isToToggled = false;

  final TextEditingController _toController = TextEditingController();

  final TextEditingController _ccController = TextEditingController();

  final TextEditingController _bccController = TextEditingController();

  final TextEditingController _subjectController = TextEditingController();

  final TextEditingController _bodyController = TextEditingController();

  final List<String> _senderMails = [
    "eijiotieno.official.mail@gmail.com",
    "david@gmail.com",
    "eve@hotmail.com",
    "nerdrotic@yahoo.com"
  ];

  @override
  void initState() {
    _fromController = TextEditingController(text: _senderMails[0]);
    super.initState();
  }

  void _pickAccount() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Accounts"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              _senderMails.length,
              (index) {
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  selected: _senderMails[index] == _fromController.text.trim(),
                  onTap: () {
                    setState(() {
                      _fromController =
                          TextEditingController(text: _senderMails[index]);
                    });
                    Navigator.pop(context);
                  },
                  title: Text(_senderMails[index]),
                );
              },
            ),
          ),
        ),
      );

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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            FromSection(
              fromController: _fromController,
              senderMails: _senderMails,
              onPickAccount: () {
                _pickAccount();
              },
            ),
            const Divider(),
            ToSection(
              toController: _toController,
              ccController: _ccController,
              bccController: _bccController,
              isToToggled: _isToToggled,
              onToToggled: () {
                setState(() {
                  _isToToggled = true;
                });
              },
              prefixColor: Theme.of(context).colorScheme.primary,
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                if (_isToToggled && _ccController.text.trim().isEmpty ||
                    _bccController.text.trim().isEmpty) {
                  setState(() {
                    _isToToggled = false;
                  });
                }
              },
              child: SubjectSection(controller: _subjectController),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                if (_isToToggled && _ccController.text.trim().isEmpty ||
                    _bccController.text.trim().isEmpty) {
                  setState(() {
                    _isToToggled = false;
                  });
                }
              },
              child: BodySection(controller: _bodyController),
            ),
          ],
        ),
      ),
    );
  }
}
