
import 'package:app/home_page.dart';
import 'package:app/main.dart';
import 'package:app/signup_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body: StreamBuilder<User?> (
stream: FirebaseAuth.instance.authStateChanges(),
builder: (context,snapshot){

if(snapshot.hasData){

  return HomePage(email: "someemail",);
}else{

  return MyHomePage();
}

},

 ),


    );
  }
}