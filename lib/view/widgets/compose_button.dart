import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../pages/compose_page.dart';

class ComposeButton extends ConsumerWidget {
  const ComposeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DeviceScreenType screenType = getDeviceType(MediaQuery.of(context).size);

    bool showExtended = screenType == DeviceScreenType.desktop ||
        screenType == DeviceScreenType.mobile;

    void onPressed() {
      if (screenType == DeviceScreenType.mobile) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const ComposePage();
            },
          ),
        );
      } else {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 600,
                  maxHeight: MediaQuery.of(context).size.height * 0.75,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: ComposePage(),
                ),
              ),
            ),
          ),
        );
      }
    }

    if (showExtended) {
      return FloatingActionButton.extended(
        elevation: 0,
        onPressed: onPressed,
        icon: const Icon(Icons.create_rounded),
        label: const Text("Compose"),
      );
    } else {
      return FloatingActionButton(
        elevation: 0,
        onPressed: onPressed,
        child: const Icon(Icons.create_rounded),
      );
    }
  }
}
