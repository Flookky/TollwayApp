import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 230.0, height: 230.0, margin: EdgeInsets.all(0),
      child: Image.asset('assets/images/logo.png', fit: BoxFit.contain,),
    );
  }
}
