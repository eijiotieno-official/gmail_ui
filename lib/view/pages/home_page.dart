import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'mail_detail_page.dart';
import '../widgets/async_view_builder.dart';
import '../widgets/mail_list.dart';
import '../../view_model/mail_view_model.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../view_model/drawer_view_model.dart';
import '../widgets/compose_button.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_rail.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final key = ref.watch(drawerProvider);

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final screenType = sizingInformation.deviceScreenType;

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            systemNavigationBarColor: Theme.of(context).colorScheme.surface,
            statusBarColor: Theme.of(context).colorScheme.surface,
            systemNavigationBarIconBrightness:
                Theme.of(context).brightness == Brightness.dark
                    ? Brightness.light
                    : Brightness.dark,
            statusBarIconBrightness:
                Theme.of(context).brightness == Brightness.dark
                    ? Brightness.light
                    : Brightness.dark,
          ),
          child: AsyncView(
            asyncValue: ref.watch(mailProvider),
            builder: (mails) {
              return Scaffold(
                key: key,
                drawer: screenType == DeviceScreenType.mobile
                    ? CustomDrawer()
                    : null,
                body: SafeArea(
                  child: Row(
                    children: [
                      CustomRail(),
                      Expanded(
                        flex: 2,
                        child: MailList(mails: mails),
                      ),
                      if (ref.watch(openedMailProvider) != null &&
                          screenType == DeviceScreenType.desktop)
                        Expanded(
                          flex: 2,
                          child: MailDetailPage(),
                        ),
                    ],
                  ),
                ),
                floatingActionButton: screenType == DeviceScreenType.mobile &&
                        ref.watch(openedMailProvider) == null
                    ? ComposeButton()
                    : null,
              );
            },
          ),
        );
      },
    );
  }
}
