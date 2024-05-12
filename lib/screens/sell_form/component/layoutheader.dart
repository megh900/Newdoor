import 'package:flutter/material.dart';

import '../../../constants.dart';

class LayoutHeader extends StatelessWidget {
  const LayoutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Register Property",
          style: headingStyle,
        ),
        SizedBox(
          height: 8,
        ),
        const Text(
          "Complete your details of your property",
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 8,
        ),
        const Text(
          "Enter Details About Owner",
          style: TextStyle(fontSize: 20,letterSpacing: 1,decoration: TextDecoration.underline),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
