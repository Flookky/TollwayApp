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

  Widget usernameField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              //fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              hintText: 'Username',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23),
                  borderSide: BorderSide(
                    width: 3,
                  )
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 20.0,top: 14.0),
              prefixIcon: Icon(
                Icons.people_outline,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget passwordField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              //fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23),
                  borderSide: BorderSide(
                    width: 3,
                  )
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 20.0,top: 14.0),
              prefixIcon: Icon(
                Icons.lock_outlined,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget rePasswordField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              //fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              hintText: 'Re Password',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23),
                  borderSide: BorderSide(
                    width: 3,
                  )
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 47.0,top: 14.0),
              // prefixIcon: Icon(
              //   Icons.lock_outlined,
              //   color: Colors.black,
              // ),
            ),
          ),
        )
      ],
    );
  }

  Widget emailField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              //fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23),
                  borderSide: BorderSide(
                    width: 3,
                  )
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 20.0,top: 14.0),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget telField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 12),
          child: Text(
            'Tel',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            ),
            //style: kLabelStyle,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              //fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              hintText: 'Tel',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23),
                  borderSide: BorderSide(
                    width: 3,
                  )
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 20.0,top: 14.0),
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.of(context)
              .push(
              MaterialPageRoute(builder: (context) => UserInform())
          );
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          // side: BorderSide(color: Colors.grey, width: 3)
        ),
        color: Colors.purple[900],
        child: Text(
          'REGISTER',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
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
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 20,),
                        CustomImage(
                          width: 150.0,
                          height: 150.0,
                          margin: 0,
                          image_path: 'assets/logos/logo_changed.png',
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20,),
                        usernameField(),
                        SizedBox(height: 10,),
                        passwordField(),
                        SizedBox(height: 10,),
                        rePasswordField(),
                        SizedBox(height: 10,),
                        emailField(),
                        SizedBox(height: 30,),
                        _buildRegisterBtn(),
                        SizedBox(height: 30,),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: AppBar(
                    //title: Text("Transparent AppBar"),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    // actions: <Widget>[
                    //   IconButton(
                    //     icon: Icon(Icons.share),
                    //     onPressed: () {},
                    //     tooltip: 'Share',
                    //   ),
                    // ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
