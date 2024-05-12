import 'package:first/preference/pref_utils.dart';
import 'package:first/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenDrawer extends StatefulWidget {

  @override
  State<HomeScreenDrawer> createState() => _HomeScreenDrawerState();
}

class _HomeScreenDrawerState extends State<HomeScreenDrawer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readRecord();
  }
  String email='';
  readRecord() async {

    final SharedPreferences pref = await SharedPreferences.getInstance();
     email = pref.getString('email') ?? "";

    setState(() {
      '''
      email : $email
      ''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          buildUserAccountHeader(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              //Navigator.pushNamed(context, AppRoute.categoryListScreen);
            },
          ),
          ListTile(
            leading: Icon(Icons.person_2_outlined),
            title: Text('My Profile'),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.contact_page),
            title: Text('Contact Us'),
            onTap: () {
              //Navigator.pushNamed(context, AppRoute.categoryListScreen);
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            onTap: () {
              //Navigator.pushNamed(context, AppRoute.categoryListScreen);
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () {
              Navigator.pushNamed(context, AppRoute.aboutScreen);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text('LogOut'),
            onTap: () {
              // PrefUtils.logout().then((value) {
              //   if(value){
              //     Navigator.pushNamedAndRemoveUntil(context, AppRoute.signInScreen, (route) => false);
              //   }
              // }
              // );
              showDialog(context: context, builder:(context) {
                return Container(
                  child: AlertDialog(
                    icon: Icon(Icons.login_rounded,size: 74),
                    title: Text("Are you sure?"),
                    titleTextStyle: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.w400
                    ),
                    content: Text("Ohhh No.....! \n"
                        "You're Leaving....?",textAlign: TextAlign.center),
                    actions: [
                       ElevatedButton(onPressed: () {
                           Navigator.pop(context);
                       }, child: Text("Nahh...")),
                      ElevatedButton(onPressed: () {
                           PrefUtils.logout().then((value) {
                              if(value){
                            Navigator.pushNamedAndRemoveUntil(context, AppRoute.signInScreen, (route) => false);
                               }
                              }
                            );
                      }, child: Text("Yess!!"))
                    ],
                  ),
                );
               },
              );
            },
          ),
        ],
      ),
    );
  }

  buildUserAccountHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text("RentFlow", style: TextStyle(color: Colors.white),),
      accountEmail: Text('$email',style: TextStyle(color: Colors.white),),
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset('assets/images/img.png', height: 45, width: 45,),
      ),
    );
  }
}
