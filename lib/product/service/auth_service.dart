import 'package:debt_tracker/product/utility/custom_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';

final class AuthService {
  AuthService._();
  static Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      //! Exceptions will be handled
      if (e.code == 'user-not-found') {
        CustomToast.showToast('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CustomToast.showToast('Wrong password provided for that user.');
      }
    }
  }

  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static bool isLoggedIn() {
    return ((FirebaseAuth.instance.currentUser != null) ? true : false);
  }
}
