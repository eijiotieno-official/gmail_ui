import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FromSection extends StatefulWidget {
  const FromSection({super.key});

  @override
  State<FromSection> createState() => _FromSectionState();
}

class _FromSectionState extends State<FromSection> {
  TextEditingController _mailController = TextEditingController();

  List<String> senderMails = [
    "eijiotieno.official.mail@gmail.com",
    "david@gmail.com",
    "eve@hotmail.com",
    "nerdrotic@yahoo.com"
  ];

  @override
  void initState() {
    _mailController = TextEditingController(text: senderMails[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Accounts"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                senderMails.length,
                (index) {
                  return ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    selected: senderMails[index] == _mailController.text.trim(),
                    onTap: () {
                      setState(() {
                        _mailController =
                            TextEditingController(text: senderMails[0]);
                      });
                      Navigator.pop(context);
                    },
                    title: Text(senderMails[index]),
                  );
                },
              ),
            ),
          ),
        );
      },
      title: Row(
        children: [
          Text(
            "From    ",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const Expanded(
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
      trailing: const Icon(Icons.keyboard_arrow_down_rounded),
    );
  }
}
