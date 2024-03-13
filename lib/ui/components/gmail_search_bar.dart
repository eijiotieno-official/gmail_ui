import 'package:flutter/material.dart';

class GmailSearchBar extends StatelessWidget {
  const GmailSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kTextTabBarHeight,
      child: SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            controller: controller,
            onTap: () => controller.openView(),
            hintText: "Search Gmail",
            trailing: [
              IconButton(
                onPressed: () => controller.openView(),
                icon: const Icon(
                  Icons.search_rounded,
                ),
              ),
            ],
          );
        },
        suggestionsBuilder: (context, controller) {
          return [];
        },
      ),
    );
  }
}
