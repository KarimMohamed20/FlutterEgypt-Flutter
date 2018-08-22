import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Social extends StatefulWidget {
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {

  void facebook() async {
  const url = 'https://facebook.com/groups/FlutterEgypt';
  if (await canLaunch(url)) {
    await launch(url,forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
  void twitter() async {
  const url = 'https://twitter.com/FlutterEgypt';
  if (await canLaunch(url)) {
    await launch(url,forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
  void meetup() async {
  const url = 'https://meetup.com/FlutterEgypt';
  if (await canLaunch(url)) {
    await launch(Uri.encodeFull(url),forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
void instagram() async {
  const url = 'https://instagram.com/FlutterEgypt';
  if (await canLaunch(url)) {
    await launch(Uri.encodeFull(url),forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
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
            new ListTile(
              title: new Text("Facebook"),
              leading: new FadeInImage(
                image: new NetworkImage(
                    "https://fr.facebookbrand.com/wp-content/uploads/2016/05/FB-fLogo-Blue-broadcast-2.png"),
                placeholder: new AssetImage("images/flutter_black.png"),
                width: 35.0,
                height: 35.0,
              ),
              onTap: facebook,
              trailing: new Icon(Icons.navigate_next),
            ),
            new ListTile(
              title: new Text("Twitter"),
              leading: new FadeInImage(
                image: new NetworkImage(
                    "https://logos-download.com/wp-content/uploads/2016/02/Twitter_logo_bird_transparent_png.png"),
                placeholder: new AssetImage("images/flutter_black.png"),
                width: 35.0,
                height: 35.0,
              ),
              onTap: twitter,
              trailing: new Icon(Icons.navigate_next),
            ),
            new ListTile(
              title: new Text("MeetUp"),
              leading: new FadeInImage(
                image: new NetworkImage(
                    "https://static1.squarespace.com/static/57a1be572e69cf806ab12968/t/59fdf47b8e7b0f1f9f78c06c/1531147407690/meetup-logo-script-1200x630.png?format=300w"),
                width: 35.0,
                height: 35.0,
                placeholder: new AssetImage("images/flutter_black.png"),
              ),
              onTap: meetup,
              trailing: new Icon(Icons.navigate_next),
            ),
            new ListTile(
              title: new Text("Instagram"),
              leading: new FadeInImage(
                image: new NetworkImage(
                    "http://diylogodesigns.com/blog/wp-content/uploads/2016/05/instagram-Logo-PNG-Transparent-Background-download.png"),
                width: 35.0,
                height: 35.0,
                placeholder: new AssetImage("images/flutter_black.png"),
              ),
              onTap: meetup,
              trailing: new Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),
    );
  }
}
