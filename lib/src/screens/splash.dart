import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tollway/src/screens/login.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    // if(getCurrentUser() == null){
    //   Timer(Duration(milliseconds: 2000), () {
    //     Navigator.of(context).pushReplacement(MaterialPageRoute(
    //       builder: (context) => LoginScreen(),
    //     ));
    //   });
    // } else {
    //   Timer(Duration(milliseconds: 2000), () {
    //     Navigator.of(context).pushReplacement(MaterialPageRoute(
    //       builder: (context) => HomeScreen(),
    //     ));
    //   });
    // }
    // Timer(Duration(milliseconds: 2000), () {
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[400],
      body: Center(
          child: Text(
            'Tollway',
            style: TextStyle(
                fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
          )),
    );
  }

  Future<User> getCurrentUser() async{
    User _user = await FirebaseAuth.instance.currentUser;
    print('User is = $_user');
    if(_user == null){
      Timer(Duration(milliseconds: 2000), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
      });
    } else {
      Timer(Duration(milliseconds: 2000), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
      });
    }

    //print('User: ${_user.email ?? "User = None"}');
    //print('Name: ${_user.displayName ?? "Name = None"}');

    return _user;
  }
}
