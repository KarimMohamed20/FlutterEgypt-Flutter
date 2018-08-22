import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  List posts;
  Future<String> getPosts() async {
    var response = await http.get(
        Uri.encodeFull("http://192.168.1.2:8010/posts"),
        headers: {"Accept": "application/json"});

    setState(() {
      posts = JSON.decode(response.body);
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getPosts();
  }

  Future<Null> refreshList() async {
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: refreshList,
        child: ListView.builder(
          itemCount: posts == null ? 0 : posts.length,
          itemBuilder: (context, index) {
            return new Container(
              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new CircleAvatar(
                        child: new Text(
                          posts[index]["Name"][0],
                          style: new TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Colors.red,
                      ),
                      new Text(
                        "  " + posts[index]["Name"],
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  new Text(
                    posts[index]["Content"],
                    style: new TextStyle(fontSize: 17.0),
                  ),
                  new FadeInImage(
                    image: new NetworkImage(posts[index]["Image"]),
                    placeholder: AssetImage("images/flutter_black.png"),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
