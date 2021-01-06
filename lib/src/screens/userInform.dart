import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tollway/src/widgets/CustomImage.dart';
import 'package:tollway/src/widgets/appBg.dart';
import 'package:tollway/src/widgets/constants.dart';

class UserInform extends StatefulWidget {
  @override
  _UserInformState createState() => _UserInformState();
}

class _UserInformState extends State<UserInform> {
  final double boxHeight = 30.0;
  final kBoxDecorationStyle = BoxDecoration(
    color: Color(0xFFBA68C8),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );

  Widget nameBlock(){
    return Container(

    );
  }

  Widget detailTxt(){
    return Container(
      child: Column(
        children: <Widget>[
          Text('Name',),
          SizedBox(height: boxHeight,),
          Text('Surname'),
          SizedBox(height: boxHeight,),
          Text('Date of birth'),
          SizedBox(height: boxHeight,),
          Text('Citizen Id'),
          SizedBox(height: boxHeight,),
          Text('E-mail'),
          SizedBox(height: boxHeight,),
          Text('Username'),
          SizedBox(height: boxHeight,),
          Text('Password'),
          SizedBox(height: boxHeight,),
          Text('Re Password'),
        ],
      ),
    );
  }
  
  Widget detailField(){
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: SizedBox(
              height: 20,
              child: TextField(

              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                AppBackground(),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 20.0,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 20,),
                          CustomImage(
                            width: 130.0,
                            height: 130.0,
                            margin: 0,
                            image_path: 'assets/logos/logo_white.png',
                          ),
                          //detailField(),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
