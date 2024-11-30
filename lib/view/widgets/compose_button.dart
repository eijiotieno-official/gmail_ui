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

    return showExtended
        ? FloatingActionButton.extended(
            elevation: 0,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const ComposePage();
                },
              ),
            ),
            icon: const Icon(Icons.create_rounded),
            label: const Text("Compose"),
          )
        : FloatingActionButton(
            elevation: 0,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const ComposePage();
                },
              ),
            ),
            child: const Icon(Icons.create_rounded),
          );
  }
}
