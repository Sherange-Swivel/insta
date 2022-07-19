import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta/models/user.dart';
import 'package:insta/providers/user_provider.dart';
import 'package:insta/resources/post_methods.dart';
import 'package:insta/utils/colors.dart';
import 'package:insta/utils/utils.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  final TextEditingController _captionController = TextEditingController();

  bool _isLoading = false;

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(title: const Text("Create a Post"), children: [
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Take a photo"),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.camera);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Choose a photo"),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.gallery);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            )
          ]);
        });
  }

  void _postImage(
    String uid,
    String username,
    String profileImage,
  ) async {
    setState(() {
      _isLoading = true;
    });
    try {
      if (_file != null) {
        String res = await PostMethods().uploadPost(
            _captionController.text, _file!, uid, username, profileImage);

        if (res == "success") {
          showSnackBar("Posted!", context);
          clearImage();
        } else {
          showSnackBar(res, context);
        }
        setState(() {
          _isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(error.toString(), context);
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _captionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return _file == null
        ? Center(
            child: IconButton(
              icon: const Icon(Icons.upload),
              onPressed: () {
                _selectImage(context);
              },
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  clearImage();
                },
              ),
              title: const Text("Post to"),
              centerTitle: false,
              actions: [
                TextButton(
                  onPressed: () {
                    _postImage(user.uid, user.username, user.url);
                  },
                  child: const Text(
                    "Post",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                )
              ],
            ),
            body: Column(children: [
              _isLoading ? const LinearProgressIndicator() : Container(),
              const Padding(padding: EdgeInsets.only(top: 8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.url),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: TextField(
                      controller: _captionController,
                      decoration: const InputDecoration(
                          hintText: "Write a caption",
                          border: InputBorder.none),
                      maxLines: 8,
                    ),
                  ),
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          alignment: FractionalOffset.topCenter,
                          image: MemoryImage(_file!),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          );
  }
}
