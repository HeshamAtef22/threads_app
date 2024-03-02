import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:threads_app/screens/home_screen.dart';
import 'package:threads_app/screens/login_screen.dart';

class TestLog extends StatelessWidget {
  const TestLog({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            final user = snapshot.data;
            if(user == null){
              return LoginScreen();
            }else{
              return Home_screen();
            }
          })
    );
  }
}
