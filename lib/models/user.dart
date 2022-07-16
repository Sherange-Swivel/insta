import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String url;
  final String username;
  final String bio;
  final List followers;
  final List following;

  User(
      {required this.email,
      required this.uid,
      required this.url,
      required this.username,
      required this.bio,
      required this.followers,
      required this.following});

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'bio': bio,
        "followers": followers,
        "following": following,
        "url": url
      };

  static User fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> snapshotData = snapshot.data() as Map<String, dynamic>;
    return User(
        uid: snapshotData["uid"],
        username: snapshotData["username"],
        email: snapshotData["email"],
        url: snapshotData["url"],
        bio: snapshotData["bio"],
        followers: snapshotData["followers"],
        following: snapshotData["following"]);
  }
}
