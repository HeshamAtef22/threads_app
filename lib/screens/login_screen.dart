import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset("assets/images/Pattern.png"),
          OutlinedButton(
            style: ButtonStyle(
              //minimumSize: MaterialStateProperty.all(Size(size.width * .80, size.height * .06)),
              fixedSize: MaterialStateProperty.all(Size(size.width * .90, size.height * .08)),
            ),
              onPressed: (){
                signInWithGoogle();
              }, child: ListTile(
            title: Text("Login with Google"),
            textColor: Colors.white,
            subtitle:  Row(
              children: [
                Text("@Hisham Atef"),
                Image.asset("assets/images/Verified.png", height: 30, width: 30,),
              ],
            ),
            //trailing: Icon(Icons.facebook),
            trailing: Image.asset("assets/images/g.png", height: 30, width: 30,),
            iconColor: Colors.white,

              )),
          SizedBox(height: 20,),
          Text("Switch accounts", style: TextStyle(color: Colors.white),)
        ]
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
