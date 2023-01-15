import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/User/Data/UserFirestore.dart';

import '../Data/UserData.dart';

class AuthService {
  Future<String?> registration({
    required Userr user,
    // required String password,
  }) async {
    try {
      // user.
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:user.email,
        password: user.pw,
      ).then((currentUser) async =>  await createUserobj(user)).onError((error, stackTrace) => error.toString()).onError((error, stackTrace) => error.toString());
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
    return 'Success';
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }
}