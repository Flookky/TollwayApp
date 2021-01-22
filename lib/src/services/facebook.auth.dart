import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookAuth{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin facebookLogin = FacebookLogin();

  Future<User> signInWithFacebook() async{
    await Firebase.initializeApp();

    final FacebookLoginResult result = await facebookLogin.logIn(['email']);
    final FacebookAccessToken accessToken = result.accessToken;



  }


}
