import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodie_bunny/providers/authentication.dart';
import 'package:foodie_bunny/screens/home_page.dart';
import 'package:foodie_bunny/widgets/sign_in.dart';
import 'package:provider/provider.dart';
//import 'package:test_app/providers/google_sign_in.dart';
//import 'package:test_app/screens/home_page.dart';
//import 'package:test_app/widgets/sign_in_widget.dart';

class AuthPage extends StatelessWidget {
  //_googleSignIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[900],
        child: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                final provider = Provider.of<GoogleSignInProvider>(context);
                if (provider.isSigningIn) {
                  return buildLoading();
                } else if (snapshot.hasData) {
                  return HomePage();
                  //Navigator.of(context).pushNamed(HomePage.nameRoute);
                } else {
                  return SignUpWidget();
                }
              }),
        ),
      ),
    );
  }

  Widget buildLoading() => Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.orange,
        ),
      );
}
