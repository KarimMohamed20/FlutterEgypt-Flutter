import 'package:flutter/material.dart';
import 'package:flutter_egypt/ui/Drawer/AboutUs.dart';
import 'package:flutter_egypt/ui/Drawer/SocialGroups.dart';
import 'package:flutter_egypt/ui/Tabs/Events.dart';
import 'package:flutter_egypt/ui/Tabs/Posts.dart';
import 'package:flutter_egypt/ui/Drawer/Feedback.dart';

class AfterLogin extends StatefulWidget {
  @override
  _AfterLoginState createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin>
    with SingleTickerProviderStateMixin {
  TabController controller;


  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        child: Container(
          decoration: BoxDecoration(color: Colors.black),
          child: new Drawer(
            child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text(""),
                  accountEmail: new Text(""),
                  decoration: new BoxDecoration(
                      image: DecorationImage(
                          image: new NetworkImage(
                              "https://scontent.faly2-1.fna.fbcdn.net/v/t1.0-9/32215431_1022520994579190_8356004538183843840_n.jpg?_nc_cat=0&oh=cf75a2e533b24bacec2b036d771f3e1f&oe=5BFB6D91"),
                          fit: BoxFit.fill)),
                ),
                new ListTile(
                  title: new Text("Social Groups"),
                  trailing: new Icon(
                    Icons.account_box,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new Social()));
                  },
                ),
                new Divider(),
                new ListTile(
                  title: new Text("About Us"),
                  trailing: new Image.asset(
                    "images/flutter_black.png",
                    width: 35.0,
                    height: 35.0,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new AboutUs()));
                  },
                ),
                new Divider(),
                new ListTile(
                  title: new Text("Feedback"),
                  trailing: new Icon(
                    Icons.star,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new ContactUs()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: new Image.asset(
          "images/flutter_black.png",
          width: 40.0,
          height: 40.0,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              child: new Text(
                "Posts",
                style: new TextStyle(color: Colors.black),
              ),
            ),
            new Tab(
              child: new Text(
                "Events",
                style: new TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      body: new Container(
          child: new TabBarView(
        controller: controller,
        children: <Widget>[new Posts(), new Events()],
      )),
    );
  }
}
