import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Signed Out");
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class GoogleSignInProvider extends ChangeNotifier{
//   final googleSignIn = GoogleSignIn();
//   bool _isSigningIn;
//
//   GoogleSignInProvider(){
//     _isSigningIn = false;
//   }
//
//   bool get isSigningIn => _isSigningIn;
//   set isSigningIn(bool isSigningIn){
//     _isSigningIn = isSigningIn;
//     notifyListeners();
//   }
//
//   Future login() async {
//     isSigningIn = true;
//     final user = await googleSignIn.signIn();
//     if(user == null){
//       isSigningIn = false;
//       return;
//     } else{
//       final googleAuth = await user.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       isSigningIn = false;
//     }
//   }
//
//   void logout() async{
//     await googleSignIn.disconnect();
//     FirebaseAuth.instance.signOut();
//   }
// }