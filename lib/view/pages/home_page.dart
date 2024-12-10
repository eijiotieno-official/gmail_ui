import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../view_model/drawer_view_model.dart';
import '../../view_model/mail_view_model.dart';
import '../widgets/async_view_builder.dart';
import '../widgets/compose_button.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_rail.dart';
import '../widgets/mail_list.dart';
import 'mail_detail_page.dart';

/// HomePage is the main entry point for displaying mail content.
/// It adapts to different screen sizes using `ResponsiveBuilder`.
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        final deviceType = sizingInfo.deviceScreenType;

        // Determine which UI components to show based on device type.
        final showDrawer = deviceType == DeviceScreenType.mobile;
        final showMailDetailPage = deviceType == DeviceScreenType.desktop &&
            ref.watch(openedMailProvider) != null;
        final showComposeButton = deviceType == DeviceScreenType.mobile &&
            ref.watch(openedMailProvider) == null;

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: _getSystemUiOverlayStyle(context),
          child: AsyncView(
            asyncValue: ref.watch(mailProvider),
            builder: (mails) => Scaffold(
              key: ref.watch(drawerProvider),
              drawer: showDrawer ? const CustomDrawer() : null,
              body: SafeArea(
                child: Row(
                  children: [
                    const CustomRail(),
                    Expanded(
                      flex: 2,
                      child: MailList(mails: mails),
                    ),
                    if (showMailDetailPage)
                      const Expanded(
                        flex: 2,
                        child: MailDetailPage(),
                      ),
                  ],
                ),
              ),
              floatingActionButton:
                  showComposeButton ? const ComposeButton() : null,
            ),
          ),
        );
      },
    );
  }

  /// Configures the system UI style for status and navigation bars.
  SystemUiOverlayStyle _getSystemUiOverlayStyle(BuildContext context) {
    final theme = Theme.of(context);
    return SystemUiOverlayStyle(
      systemNavigationBarColor: theme.colorScheme.surface,
      statusBarColor: theme.colorScheme.surface,
      systemNavigationBarIconBrightness: theme.brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
      statusBarIconBrightness: theme.brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
    );
  }
}
