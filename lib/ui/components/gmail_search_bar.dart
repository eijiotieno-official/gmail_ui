import 'package:flutter/material.dart';

class GmailSearchBar extends StatelessWidget {
  const GmailSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox(
        width: double.infinity,
        child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              elevation: const MaterialStatePropertyAll(1),
              controller: controller,
              leading: IconButton(
                onPressed: () => controller.openView(),
                icon: const Icon(
                  Icons.search_rounded,
                ),
              ),
              onTap: () => controller.openView(),
              hintText: "Search Gmail",
              trailing: [
                // IconButton(
                //   onPressed: () => controller.openView(),
                //   icon: const Icon(
                //     Icons.search_rounded,
                //   ),
                // ),
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
