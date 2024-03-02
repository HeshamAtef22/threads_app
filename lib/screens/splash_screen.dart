import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:threads_app/screens/home_screen.dart';
import 'package:threads_app/screens/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      //هعمل كونديشن يتشيك لو القيمة الراجعه من المستخدم ب نل او لا وهبدأ اوج المستخدم للصفحة حسب الكونديشن
      FirebaseAuth.instance.currentUser ==null?
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),)):
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home_screen(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/threads-logo.png"),
      )
    );
  }
}
