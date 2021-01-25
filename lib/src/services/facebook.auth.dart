import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookAuth{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin facebookLogin = FacebookLogin();

  Future<User> loginWithFacebook() async {
    var facebookLogin = new FacebookLogin();
    var result = await facebookLogin.logIn(['email']);

    print(result.status.toString());
    print(result.errorMessage.toString());

    if (result.status == FacebookLoginStatus.loggedIn) {
      FacebookAccessToken facebookAccessToken = result.accessToken;
      AuthCredential authCredential = FacebookAuthProvider.credential(facebookAccessToken.token);

      User user = (await _auth.signInWithCredential(authCredential)).user;
      print('user = $user');
      return user;
    }
    return null;
  }

  Future<Null> signOutFacebook() async {
    await _auth.signOut();
    await facebookLogin.logOut();
    print("User Facebook Signed Out");
  }

}
