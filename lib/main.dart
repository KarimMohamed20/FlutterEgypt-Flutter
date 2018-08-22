import 'package:flutter/material.dart';
import 'package:flutter_egypt/ui/HomePage.dart';

void main() => runApp(
  new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new HomePage(),
      theme: new ThemeData(
        accentColor: Colors.black,
        primaryColor: Colors.black,
        
      ),
    ));

