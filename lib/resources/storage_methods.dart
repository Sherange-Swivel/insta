import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //adding image to firebase storage
  Future uploadImageToStorage(
      String childName, Uint8List file, bool isPost) async {
    try {
      //create referance for file
      Reference ref =
          _storage.ref().child(childName).child(_auth.currentUser!.uid);

      if (isPost) {
        String id = const Uuid().v1();
        ref = ref.child(id);
      }

      UploadTask uploadTask = ref.putData(file);

      TaskSnapshot snapshot = await uploadTask;

      String downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (er) {
      print(er.toString());
      return null;
    }
  }
}
