import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta/models/post.dart';
import 'package:insta/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class PostMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload post
  Future<String> uploadPost(String caption, Uint8List file, String uid,
      String username, String profileImage) async {
    String res = "Some error occurred";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage("POSTS", file, true);

      String postId = const Uuid().v1();

      Post post = Post(
        postId: postId,
        caption: caption,
        photoUrl: photoUrl,
        uid: uid,
        username: username,
        profileImage: profileImage,
        datePublished: DateTime.now(),
        likes: [],
      );

      //add post to databse
      await _firestore.collection("posts").doc(postId).set(post.toJson());
      res = "success";
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
