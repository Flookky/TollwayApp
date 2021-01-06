import 'package:flutter/material.dart';
import 'package:tollway/src/widgets/CustomImage.dart';

class UserScreen extends StatelessWidget {

  Widget nameField(){
    return Container(
      alignment: Alignment.centerLeft,
      child: TextField(
        obscureText: true,
        style: TextStyle(
          color: Colors.black,
          //fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          hintText: 'Name',
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
          // prefixIcon: Icon(
          //   Icons.lock,
          //   color: Colors.black,
          // ),
        ),
      ),
    );
  }

  Widget surnameField(){
    return Container(
      alignment: Alignment.centerLeft,
      child: TextField(
        obscureText: true,
        style: TextStyle(
          color: Colors.black,
          //fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          hintText: 'Surname',
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
          // prefixIcon: Icon(
          //   Icons.lock,
          //   color: Colors.black,
          // ),
        ),
      ),
    );
  }

  Widget birthDayField(){
    return Container(
      alignment: Alignment.centerLeft,
      child: TextField(
        obscureText: true,
        style: TextStyle(
          color: Colors.black,
          //fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          hintText: 'BirthDay',
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
          // prefixIcon: Icon(
          //   Icons.lock,
          //   color: Colors.black,
          // ),
        ),
      ),
    );
  }

  Widget citizenIdField(){
    return Container(
      alignment: Alignment.centerLeft,
      child: TextField(
        obscureText: true,
        style: TextStyle(
          color: Colors.black,
          //fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          hintText: 'Citizen Id',
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
          // prefixIcon: Icon(
          //   Icons.lock,
          //   color: Colors.black,
          // ),
        ),
      ),
    );
  }

  Widget emailField(){
    return Container(
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
          // prefixIcon: Icon(
          //   Icons.lock,
          //   color: Colors.black,
          // ),
        ),
      ),
    );
  }

  Widget telField(){
    return Container(
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
          // prefixIcon: Icon(
          //   Icons.lock,
          //   color: Colors.black,
          // ),
        ),
      ),
    );
  }

  Widget logoutBtn(){
    return Container(

    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 20.0,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              CustomImage(
                width: 100.0,
                height: 100.0,
                margin: 20,
                image_path: 'assets/icons/user.png',
              ),
              Text(
                'Member No.24569',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20,),
              nameField(),
              SizedBox(height: 20,),
              surnameField(),
              SizedBox(height: 20,),
              birthDayField(),
              SizedBox(height: 20,),
              citizenIdField(),
              SizedBox(height: 20,),
              emailField(),
              SizedBox(height: 20,),
              telField(),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    CustomImage(
                      width: 32.0,
                      height: 32.0,
                      margin: 10,
                      image_path: 'assets/icons/edit.png',
                    ),
                    Spacer(flex: 2),
                    CustomImage(
                      width: 32.0,
                      height: 32.0,
                      margin: 10,
                      image_path: 'assets/icons/update.png',
                    ),
                  ],
                ),
              ),

            ],
          ),
        )
      ),
    );
  }
}
