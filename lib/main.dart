import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiple_image_picker/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: home_page(),
    theme: ThemeData(fontFamily: 'SfPro'),
  ));
}
