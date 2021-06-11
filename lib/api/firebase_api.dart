import 'package:firebase_auth/firebase_auth.dart';

class FirebaseApi {
  static String getUsername() {
    return FirebaseAuth.instance.currentUser.displayName;
  }

  static String getUseremail() {
    return FirebaseAuth.instance.currentUser.email;
  }

  static String getUserphoto() {
    return FirebaseAuth.instance.currentUser.photoURL;
  }

  static String getUsernumber() {
    return FirebaseAuth.instance.currentUser.phoneNumber;
  }

  static logout() {
    return FirebaseAuth.instance.signOut();
  }
}
