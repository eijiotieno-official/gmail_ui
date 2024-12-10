import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/base/account_model.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../view_model/account_view_model.dart';
import '../../view_model/drawer_view_model.dart';
import 'account_view.dart';

class CustomSearchBar extends ConsumerWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Determine the screen type for responsive UI
    DeviceScreenType screenType = getDeviceType(MediaQuery.of(context).size);

    // Set padding based on the screen type (mobile, tablet, desktop)
    final padding = getValueForScreenType<double>(
      context: context,
      mobile: 8,
      tablet: 16,
      desktop: 16,
    );

    // Watch the current user account state from Riverpod
    final currentUser = ref.watch(currentUserAccountProvider);

    return Padding(
      padding: EdgeInsets.all(padding), // Apply responsive padding
      child: SizedBox(
        width: double.infinity, // Ensure the search bar stretches to full width
        child: SearchAnchor(
          viewElevation: 1,
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              elevation:
                  WidgetStatePropertyAll(0), // No elevation for the search bar
              controller: controller,
              leading: _buildLeadingIcon(screenType, ref, controller),
              onTap: () => controller.openView(),
              hintText: "Search Gmail", // Placeholder text in the search bar
              trailing: [
                _buildAccountProfileView(currentUser, context),
              ],
            );
          },
          suggestionsBuilder: (context, controller) {
            return []; // No suggestions for now
          },
        ),
      ),
    );
  }

  // Function to build the leading icon based on the screen type
  Widget _buildLeadingIcon(
      DeviceScreenType screenType, WidgetRef ref, SearchController controller) {
    return screenType == DeviceScreenType.mobile
        ? IconButton(
            onPressed: () {
              ref
                  .read(drawerProvider.notifier)
                  .openDrawer(); // Open drawer on mobile
            },
            icon: const Icon(Icons.menu_rounded),
          )
        : IconButton(
            onPressed: () =>
                controller.openView(), // Open search on desktop/tablet
            icon: const Icon(Icons.search_rounded),
          );
  }

  // Function to build the account profile view with user information
  Widget _buildAccountProfileView(
      Account currentUser, BuildContext context) {
    return AccountProfileView(
      account: currentUser,
      onTap: () {
        // Show dialog with current user details
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: Text(
                  "Gmail",
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                    Navigator.pop(context); // Close dialog
                  },
                  child: Text("Close"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
