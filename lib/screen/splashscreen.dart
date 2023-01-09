import 'dart:async';

import 'package:blood_app/main.dart';
import 'package:blood_app/screen/home_paage.dart';
import 'package:blood_app/screen/login_screen.dart';
import 'package:blood_app/utils/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rout();
  }

  void rout()async{

    Timer(Duration(seconds: 2), () async{
      if (await FirebaseAuth.instance.currentUser != null) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => LogingPage()), (route) => false);
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        decoration:const BoxDecoration(
        ),
        child: Center(
          child: roundedLogo(250, 250, 30, 5),
        )
    );
  }
}
