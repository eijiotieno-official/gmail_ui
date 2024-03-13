import 'package:flutter/material.dart';

class GmailNavigationIcon extends StatelessWidget {
  final Icon icon;
  final int unreadCount;
  const GmailNavigationIcon({
    super.key,
    required this.icon,
    required this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    return Badge.count(
      isLabelVisible: unreadCount > 0,
      count: unreadCount,
      child: icon,
    );
  }
}
