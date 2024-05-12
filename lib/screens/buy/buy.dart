import 'package:first/screens/buy/component/body.dart';
import 'package:flutter/material.dart';

class buy extends StatelessWidget {
  const buy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      appBar: AppBar(
          backgroundColor: Colors.brown.shade300,
          title: Text("Buy / Rent",
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 24
            ),
          ),
        actions: [
          IconButton(onPressed:() {
            
          }, icon: Icon(Icons.filter_alt))
        ],
      ),
    );
  }
}
