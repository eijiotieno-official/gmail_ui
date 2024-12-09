import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ComposeButtonsOptionsView extends StatelessWidget {
  const ComposeButtonsOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isVisible = getValueForScreenType(
      context: context,
      mobile: false,
      desktop: true,
      tablet: true,
    );

    return isVisible
        ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                FilledButton(
                  onPressed: () {},
                  child: Text("Send"),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.text_format_rounded,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.attach_file_rounded,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.link_rounded,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.emoji_emotions_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.drive_folder_upload_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.schedule_send_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.create_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert_rounded,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete_outline_rounded,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
