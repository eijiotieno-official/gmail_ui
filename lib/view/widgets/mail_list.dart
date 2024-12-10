import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../model/base/mail_model.dart';
import 'custom_search_bar.dart';
import 'mail_item.dart';

class MailList extends StatelessWidget {
  final List<Mail> mails;

  const MailList({super.key, required this.mails});

  @override
  Widget build(BuildContext context) {
    // Determine the screen type (mobile, tablet, or desktop)
    DeviceScreenType screenType = getDeviceType(MediaQuery.of(context).size);

    // Adjust padding based on the screen size
    final padding = getValueForScreenType<double>(
      context: context,
      mobile: 0, // No padding for mobile devices
      tablet: 16, // Add padding for tablets and desktop
      desktop: 16,
    );

    return Column(
      children: [
        // Search bar placed at the top of the list
        const CustomSearchBar(),

        // Expanded widget ensures the mail list takes up the available space
        Expanded(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: padding, vertical: padding),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  // Conditional border color for different screen types
                  color: screenType == DeviceScreenType.mobile
                      ? Colors.transparent
                      : Theme.of(context).hoverColor,
                ),
              ),
              child: ListView.builder(
                itemCount: mails.length, // Number of mails
                physics: const BouncingScrollPhysics(), // Smooth scrolling
                itemBuilder: (context, index) {
                  // Pass necessary data to the MailItem widget
                  return MailItem(
                    mail: mails[index],
                    isFirst: index == 0, // Indicate if it's the first item
                    isLast: index ==
                        mails.length - 1, // Indicate if it's the last item
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
