import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String postId;
  final String caption;
  final String photoUrl;
  final String uid;
  final String username;
  final String profileImage;
  final DateTime datePublished;
  final List likes;

  Post(
      {required this.postId,
      required this.caption,
      required this.photoUrl,
      required this.uid,
      required this.username,
      required this.profileImage,
      required this.datePublished,
      required this.likes});

  Map<String, dynamic> toJson() => {
        'postId': postId,
        'caption': caption,
        'photoUrl': photoUrl,
        'uid': uid,
        'username': username,
        "profileImage": profileImage,
        "datePublished": datePublished,
        "likes": likes
      };

  static Post fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> snapshotData = snapshot.data() as Map<String, dynamic>;
    return Post(
        postId: snapshotData["postId"],
        caption: snapshotData["caption"],
        photoUrl: snapshotData["photoUrl"],
        uid: snapshotData["uid"],
        username: snapshotData["username"],
        profileImage: snapshotData["profileImage"],
        datePublished: snapshotData["datePublished"],
        likes: snapshotData["likes"]);
  }
}
