import 'package:first/routes/app_route.dart';
import 'package:first/screens/home/components/home_screen_drawer.dart';
import 'package:first/screens/home/components/newbody.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: newbody(),
      drawer: HomeScreenDrawer(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, AppRoute.sellformscreen);
      },child: Icon(Icons.add)),
    );
  }
}
