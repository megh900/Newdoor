import 'package:first/routes/app_route.dart';
import 'package:first/screens/sell/component/body.dart';
import 'package:flutter/material.dart';

class sell extends StatelessWidget {
  const sell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Sell",
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 28
            ),
          )),
      body: body(),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   Navigator.pushNamed(context, AppRoute.sellformscreen);
      // },child: Icon(Icons.add)),
    );
  }
}
