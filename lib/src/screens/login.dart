import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:tollway/src/screens/home.dart';
import 'package:tollway/src/screens/promotions.dart';
import 'package:tollway/src/screens/register.dart';
import 'package:tollway/src/services/facebook.auth.dart';
import 'package:tollway/src/services/google.auth.dart';
import 'package:tollway/src/utils/utils.dart';
import 'package:tollway/src/widgets/CustomImage.dart';
import 'package:tollway/src/widgets/appBg.dart';
import 'package:tollway/src/widgets/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  User _firebaseUser;
  bool _rememberMe = false;
  final userController = TextEditingController();
  final passController = TextEditingController();
  String _username = "";
  String _password = "";
  bool rememberMe = false;
  bool _isHidden = true;
  bool isSignIn = false;
  bool _isFacebookLogin = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();
  User _userFacebook;

  void _toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  Widget _buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 12),
          child: Text(
            'ชื่อผู้ใช้งาน',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16
            ),
          ),
        ),
        //SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 70.0,
          child: TextField(
            keyboardType: TextInputType.text,
            controller: userController,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              hintText: 'โปรดใส่ชื่อผู้ใช้งาน',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: Icon(
                Icons.people_outline,
                color: Colors.black,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(top: 14.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF(String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 12),
          child: Text(
            'รหัสผ่าน',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 70.0,
          child: TextField(
            obscureText: _isHidden,
            controller: passController,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              hintText: 'โปรดใส่รหัสผ่าน',
              hintStyle: TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 3,
                  )
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock_outlined,
                color: Colors.black,
              ),
              suffixIcon: hintText == "Password" ? IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden ? Icon(Icons.visibility_off_outlined) : Icon(Icons.visibility_outlined),
              ) : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'ลืมรหัสผ่าน?',
          style: TextStyle(
            color: Colors.white
          ),
          //style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'จดจำรหัสผ่าน',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => _loginCheck(),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          // side: BorderSide(color: Colors.grey, width: 3)
        ),
        color: Colors.purple[900],
        child: Text(
          'เข้าสู่ระบบ',
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
        color: Colors.white,
        child: Text(
          'ลงทะเบียนผู้ใช้งาน',
          style: TextStyle(
            color: Colors.purple[900],
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        SizedBox(height: 40.0),
        Text(
          'เข้าสู่ระบบผ่านโซเชียลมีเดีย',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16
          ),
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _googleSignInBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
        // child: FlatButton(
        //   onPressed: () {
        //
        //   },
        // ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // _buildSocialBtn(() =>{
          //   facebookLogin()
          // },
          //   AssetImage(
          //     'assets/logos/facebook.jpg',
          //   ),
          // ),
          _googleSignInBtn(() => {
            googleSignIn()
          },
            AssetImage(
              'assets/logos/google.jpg',
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20.0,),
                      CustomImage(
                        width: 150.0,
                        height: 150.0,
                        margin: 0,
                        image_path: 'assets/logos/logo_changed.png',
                      ),
                      SizedBox(height: 20.0,),
                      _buildUsernameTF(),
                      SizedBox(height: 10.0,),
                      _buildPasswordTF('Password'),
                      SizedBox(height: 10.0,),
                      _buildRememberMeCheckbox(),
                      _buildForgotPasswordBtn(),
                      _buildLoginBtn(),
                      _buildRegisterBtn(),
                      _buildSignInWithText(),
                      _buildSocialBtnRow(),
                      //_buildSignupBtn(),
                      SizedBox(height: 20.0,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _loginCheck(){
    Navigator.of(context)
        .push(
        MaterialPageRoute(builder: (context) => HomeScreen())
    );

    // _username = userController.text;
    // _password = passController.text;
    // if(_username.isEmpty){
    //   toast_short('Please Fill Username');
    // } else if(_password.isEmpty){
    //   toast_short('Please Fill Password');
    // } else {
    //   if(_username == 'admin' && _password == '1234'){
    //     toast_short('Welcome Admin');
    //     Navigator.of(context)
    //         .push(
    //         MaterialPageRoute(builder: (context) => HomeScreen())
    //     );
    //   } else {
    //     toast_short('Username or Password Incorrect');
    //   }
    // }
  }

  void googleSignIn() {
    Route route = MaterialPageRoute(builder: (context) => HomeScreen());
    GoogleAuth().signInWithGoogle().then((user) => {
      this._firebaseUser = user,
      Navigator.pushReplacement(context, route)
    });
  }

  void facebookLogin() {
    Route route = MaterialPageRoute(builder: (context) => HomeScreen());
    FacebookAuth().loginWithFacebook().then((result) {
      if(result != null){
        _userFacebook = result;
        print('Login Success');
        Navigator.pushReplacement(context, route);
      }
    });
  }

}
