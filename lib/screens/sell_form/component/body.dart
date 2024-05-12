import 'package:first/screens/sell_form/component/layoutheader.dart';
import 'package:first/screens/sell_form/component/personal.dart';
import 'package:flutter/material.dart';

class body extends StatefulWidget {
  const body({super.key});

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          AppBar(),
          LayoutHeader(),
          SizedBox(
            height: 24,
          ),
          personal(),
        ],
      ),
    );
  }
}
