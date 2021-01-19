import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:tollway/src/screens/home.dart';
import 'package:tollway/src/screens/promotions.dart';
import 'package:tollway/src/screens/register.dart';
import 'package:tollway/src/services/google.auth.dart';
import 'package:tollway/src/utils/toast.call.dart';
import 'package:tollway/src/widgets/CustomImage.dart';
import 'package:tollway/src/widgets/appBg.dart';
import 'package:tollway/src/widgets/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final FirebaseAuth firebaseAuth =FirebaseAuth.instance;
final GoogleSignIn googleSignIn =GoogleSignIn();

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  final userController = TextEditingController();
  final passController = TextEditingController();
  String _username = "";
  String _password = "";
  bool rememberMe = false;
  bool _isHidden = true;

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
            'Username',
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
              hintText: 'Username',
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
            'Password',
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
              hintText: 'Enter your Password',
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
          'Forgot Password?',
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
            'Remember me',
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
        onPressed: () => loginCheck(),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          // side: BorderSide(color: Colors.grey, width: 3)
        ),
        color: Colors.purple[900],
        child: Text(
          'LOGIN',
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
          'REGISTER',
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
          'Social Login',
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
          _buildSocialBtn(
                () => print('Login with Facebook'),
            AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _googleSignInBtn(() => { _signIn()
            //print('Login with Google')
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

  void loginCheck(){
    _username = userController.text;
    _password = passController.text;
    if(_username.isEmpty){
      toast_short('Please Fill Username');
    } else if(_password.isEmpty){
      toast_short('Please Fill Password');
    } else {
      if(_username == 'admin' && _password == '1234'){
        toast_short('Welcome Admin');
        Navigator.of(context)
            .push(
            MaterialPageRoute(builder: (context) => HomeScreen())
        );
      } else {
        toast_short('Username or Password Incorrect');
      }
    }
  }

  _googleAuth(){
    signInWithGoogle().then((result) {
      if(result != null){
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                }
            )
        );
      }
    });
  }

  _signIn() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn
        .signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
        .authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,

      accessToken: googleSignInAuthentication.accessToken,


    );
    User user = (await firebaseAuth.signInWithCredential(authCredential))
        .user;
  }
}
