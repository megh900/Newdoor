import 'package:flutter/material.dart';

class body extends StatelessWidget {
  const body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text("Welcome to RentFLow",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20
                ),
                textAlign: TextAlign.center,),
            ),
            SizedBox(height: 10,),
            Center(
              child: Text("Our Vision",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    fontSize: 20
                ),
                textAlign: TextAlign.center,),
            ),
            Text("   At RantFlow, we envision a world where property \n  "
                " management is seamless, efficient, and stress-free. \n  "
                " We are committed to simplifying property \n   "
                "management for landlords, tenants, and property \n   "
                "managers alike."),
            SizedBox(height: 10,),
            Center(
              child: Text("Who We Are",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    fontSize: 20
                ),
                textAlign: TextAlign.center,),
            ),
            SizedBox(height: 10,),
            Text(" RantFlow is a leading property management \n "
                "solution designed to empower property owners and \n "
                "managers with the tools they need to succeed. \n "
                "Our team is passionate about real estate and \n "
                "technology, bringing together a unique blend of \n "
                "expertise to create an innovative platform that \n "
                "addresses the challenges of property management."),
            SizedBox(height: 10,),
            Center(
              child: Text("What Sets Us Apart",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    fontSize: 20
                ),
                textAlign: TextAlign.center,),
            ),
            SizedBox(height: 10,),
            Text("User-Friendly Interface: ",
              style: TextStyle(fontWeight: FontWeight.w400,decoration: TextDecoration.underline),),
            SizedBox(height: 5,),
            Text("We understand the importance of simplicity. \n"
                "Our user-friendly interface ensures that property \n"
                "owners and managers can navigate the platform \n"
                "effortlessly."),
            SizedBox(height: 5,),
            Text("Comprehensive Features:  ",
              style: TextStyle(fontWeight: FontWeight.w400,decoration: TextDecoration.underline),),
            SizedBox(height: 5,),
            Text("  From rent collection and maintenance requests to \n"
                "  financial reporting and tenant communication, \n  "
                "our app offers a comprehensive suite of features \n  "
                "to cover all aspects of property management."),
            SizedBox(height: 5,),
            Text("Security and Privacy:   ",
              style: TextStyle(fontWeight: FontWeight.w400,decoration: TextDecoration.underline),),
            SizedBox(height: 5,),
            Text(" Your data security is our top priority. We employ \n"
                "state-of-the-art security measures to protect your \n"
                "information, and we are committed to maintaining \n"
                "the highest standards of privacy."),
            SizedBox(height: 10,),
            Center(
              child: Text("Our Mission",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    fontSize: 20
                ),
                textAlign: TextAlign.center,),
            ),
            SizedBox(height: 10,),
            Text(" Our mission at RantFlow is to revolutionize property \n "
                "management by providing a reliable, efficient, and \n "
                "modern solution that enhances the experience for \n "
                "property owners, managers, and tenants alike. We \n "
                "strive to simplify complex processes, reduce stress, \n "
                "and ultimately contribute to the success of property \n "
                "stakeholders.")
          ],
        ),
      ),
    );
  }
}
