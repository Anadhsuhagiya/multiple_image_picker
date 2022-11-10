
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  // Pick multiple images
  ImagePicker _picker = ImagePicker();
  late List<XFile> images = [];
  List<XFile> imagepath = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Multiple Image Picker"),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text(
                            "Select Images",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          children: [
                            ListTile(
                              title: Text("Gallary"),
                              onTap: () async {
                                Navigator.pop(context);
                                images = await _picker.pickMultiImage();
                                print(images);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    "Add Image",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  )),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: images.length,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
                itemBuilder: (context, index) {
                  return Image.file(File(images[index].path));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
