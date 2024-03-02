import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        ],
      )
    );
  }
}
