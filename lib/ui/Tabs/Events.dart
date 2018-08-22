import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  List events;
  Future<String> getPosts() async {
    var response = await http.get(
        Uri.encodeFull("http://192.168.1.2:8020/events"),
        headers: {"Accept": "application/json"});

    setState(() {
      events = JSON.decode(response.body);
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
          itemCount: events == null ? 0 : events.length,
          itemBuilder: (context, index) {
            return new Container(
              child: new Column(
                children: <Widget>[
                  new Text(events[index]["Name"]),
                  new Text(events[index]["Date"]),
                  InkWell(
                    child: new Text("MeetUp Link"),
                    onTap: () async => launch(events[index]["Meetup"]),
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
