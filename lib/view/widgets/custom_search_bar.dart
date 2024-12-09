import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../view_model/account_view_model.dart';
import '../../view_model/drawer_view_model.dart';
import 'account_view.dart';

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

    final currentUser = ref.watch(currentUserAccountProvider);

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
                AccountProfileView(
                  account: currentUser,
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Center(
                            child: Text(
                              "Gmail",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  child: Icon(Icons.person_2_rounded),
                                ),
                                title: Text(currentUser.name),
                                subtitle: Text(currentUser.email),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Close"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
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
