
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy_mark1/newcode/select_lang.dart';

import 'lastpage.dart';


class AuthService{

  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return  const LastPage(title: '',);
          } else {
            return SelectLanguage(title: '',);
          }
        });
  }
  //Sign out
  signOut(context) {
    FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('You have been logged out.')));
    
  }

  //SignIn
  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  signInWithOTP(smsCode, verId, context) {
    AuthCredential authCredential =
        PhoneAuthProvider.credential(smsCode: smsCode, verificationId: verId);
    signIn(authCredential);
    ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Phone Verified Succesfully.')));
    
  }
}
