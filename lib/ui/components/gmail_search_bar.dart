import 'package:flutter/material.dart';
import 'package:gmail_ui/data/enums/screen_type.dart';
import 'package:gmail_ui/state/drawer_notifier.dart';
import 'package:gmail_ui/state/screen_type_notifier.dart';
import 'package:gmail_ui/ui/components/gmail_profile.dart';
import 'package:provider/provider.dart';

class GmailSearchBar extends StatelessWidget {
  const GmailSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenType screenType = context.watch<ScreenTypeNotifier>().screenType;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                controller: controller,
                leading: screenType == ScreenType.mobile
                    ? IconButton(
                        onPressed: () =>
                            context.read<DrawerNotifier>().openDrawer(),
                        icon: const Icon(
                          Icons.menu_rounded,
                        ),
                      )
                    : IconButton(
                        onPressed: () => controller.openView(),
                        icon: const Icon(
                          Icons.search_rounded,
                        ),
                      ),
                onTap: () => controller.openView(),
                hintText: "Search Gmail",
                trailing: [
                  GmailProfile(
                    onTap: () {},
                  ),
                ],
              );
            },
            suggestionsBuilder: (context, controller) {
              return [];
            },
          ),
        ),
      ),
    );
  }
}
