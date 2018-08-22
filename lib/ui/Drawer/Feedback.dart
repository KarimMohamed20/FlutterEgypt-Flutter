import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController contentController = new TextEditingController();
  void sendData() async {
    Dio dio = new Dio();
    var response = await dio.post(
        "http://192.168.1.2:8000/feedback/post/${titleController.text}/${contentController.text}");
        var alert = new AlertDialog(
          title: new Text("Done!"),
          content: new Text("Thanks For Your Feedback."),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => Navigator.pop(context),
              child: new Text("Close."),
            )
          ],
        );
        showDialog(
        context: context,
        child: alert);
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
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Container(
              child: new Image.asset("images/flutter_black.png",
              width: 90.0,
              height: 90.0,),
              padding: EdgeInsets.all(45.0),
            ),
            new TextField(
              decoration: InputDecoration(
                hintText: 'Enter Your Name.',
                hintStyle: new TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15.0
                )
              ),
            ),
            new Padding(
              padding: EdgeInsets.all(20.0),
            ),
            new TextField(
              decoration: InputDecoration(
                hintText: 'Enter Your Feedback.',
              ),
            ),
            new Padding(
              padding: EdgeInsets.all(75.0),
            ),
            new RaisedButton(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                new Icon(Icons.send,
                color: Colors.black,),
                new Text("Send",
                style: new TextStyle(
                  color: Colors.black
                ),)
              ],),
              onPressed: sendData,
              padding: EdgeInsets.all(15.0),
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
