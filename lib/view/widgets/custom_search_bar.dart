import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gmail_ui/model/base/account_model.dart';
import 'package:gmail_ui/view/widgets/account_view.dart';
import 'package:gmail_ui/view_model/drawer_view_model.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomSearchBar extends ConsumerWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DeviceScreenType screenType = getDeviceType(MediaQuery.of(context).size);

    final padding = getValueForScreenType<double>(
      context: context,
      mobile: 8,
      tablet: 16,
      desktop: 16,
    );

    return Padding(
      padding: EdgeInsets.all(padding),
      child: SizedBox(
        width: double.infinity,
        child: SearchAnchor(
          viewElevation: 1,
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              elevation: WidgetStatePropertyAll(0),
              controller: controller,
              leading: screenType == DeviceScreenType.mobile
                  ? IconButton(
                      onPressed: () {
                        ref.read(drawerProvider.notifier).openDrawer();
                      },
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
                AccountProfileView(account: Account.currentUser()),
              ],
            );
          },
          suggestionsBuilder: (context, controller) {
            return [];
          },
        ),
      ),
    );
  }
}
