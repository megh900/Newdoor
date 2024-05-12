import 'package:first/components/searchfeild.dart';
import 'package:first/screens/buttons/roundedbutton.dart';
import 'package:flutter/material.dart';

class header extends StatelessWidget {
  const header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
         children: [
           roundedbutton(iconData:Icons.menu , onPressed:
           () {
                 Scaffold.of(context).openDrawer();
           },),
           SizedBox(width: 10,),
           Expanded(child: SearchField()),
           SizedBox(width: 10,),
           roundedbutton(
             iconData:Icons.shopping_cart ,
             onPressed: () {

             },
           )
         ],
    );
  }
}
