import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:threads_app/screens/login_screen.dart';

class Home_screen extends StatelessWidget {
  const Home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(FirebaseAuth.instance.currentUser?.photoURL ?? ""),
          Text(FirebaseAuth.instance.currentUser?.displayName ?? ""),
          ElevatedButton(onPressed: ()async{
           await FirebaseAuth.instance.signOut();
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
          }, child: Text("Logout")),
        ],
      )
    );
  }
}
