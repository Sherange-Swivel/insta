import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta/models/user.dart' as model;
import 'package:insta/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .get();

    return model.User.fromSnapshot(snapshot);
  }

  // sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String imageUrl = await StorageMethods()
            .uploadImageToStorage("PROFILE_PHOTOS", file, false);

        model.User user = model.User(
            email: email,
            uid: credential.user!.uid,
            url: imageUrl,
            username: username,
            bio: bio,
            followers: [],
            following: []);

        //add user to databse
        await _firestore
            .collection("users")
            .doc(credential.user!.uid)
            .set(user.toJson());
        res = "success";
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "email-already-in-use") {
        res = "This email already in use";
      } else if (error.code == "invalid-email") {
        res = "Invalid email id";
      } else if (error.code == "weak-password") {
        res = "Invalid password";
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  // login in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "wrong-password") {
        res = "Invalid user name or password";
      } else if (error.code == "user-not-found") {
        res = "Invalid user name or password";
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
