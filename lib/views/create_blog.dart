import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  File selectedImage;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Blog"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.file_upload),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              selectedImage != null
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          selectedImage,
                          fit: BoxFit.cover,
                        ),
                      ))
                  : GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(
                          Icons.add_a_photo,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
              TextField(
                decoration: InputDecoration(hintText: "Author Name"),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Title"),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Desc"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
