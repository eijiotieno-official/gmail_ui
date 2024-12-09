import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).hoverColor,
      height: 1,
      width: double.infinity,
    );
  }
}
