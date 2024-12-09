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
    DeviceScreenType screenType = getDeviceType(MediaQuery.of(context).size);

    final padding = getValueForScreenType<double>(
      context: context,
      mobile: 0,
      tablet: 16,
      desktop: 16,
    );

    return Column(
      children: [
        CustomSearchBar(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: padding,
              right: padding,
              left: padding,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: screenType == DeviceScreenType.mobile
                      ? Colors.transparent
                      : Theme.of(context).hoverColor,
                ),
              ),
              child: ListView.builder(
                itemCount: mails.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return MailItem(
                    mail: mails[index],
                    isFirst: index == 0,
                    isLast: index == (mails.length - 1),
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
