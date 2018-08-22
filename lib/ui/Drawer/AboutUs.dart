import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: new Image.asset(
          "images/flutter_black.png",
          width: 40.0,
          height: 40.0,
        ),
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new Image.network("https://scontent.faly2-2.fna.fbcdn.net/v/t1.0-9/38709895_497958877318666_8719685846069936128_n.jpg?_nc_cat=0&oh=dab4752bc148ab23314da0d9e984a9a7&oe=5BFC03CE"),
            new Text(
              "\n - We are a public group for anyone interested in Mobile Development using Google Flutter which is new SDK framework form Google to Build applications on IOS & Android with the same code base.",),
            new Text("\n - Our main target to help Arabs & Egyptians developers community to know more about Google Flutter"),
            new Text("\n - World first Flutter Meetup community ( our first meetup was 27th january 2018)"),
            new Text('\n - World first Flutter community that join Together with Google Developers (30th april 2018)')

          ],
        ),
      ),
    );
  }
}