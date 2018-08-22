import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_egypt/ui/AfterLogin.dart';
import 'package:flutter_egypt/ui/Clipper.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();

  String _message = 'Log in/out by pressing the buttons below.';

  Future<Null> _login() async {
    final FacebookLoginResult result =
        await facebookSignIn.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        _showMessage('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');

        break;

        
    }

    if (result.errorMessage == null) {
      Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context)=>new AfterLogin()
      ));
    }
    
  }

  Future<Null> _logOut() async {
    await facebookSignIn.logOut();
    _showMessage('Logged out.');
  }

  void _showMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipPath(
                child: new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.all(80.0),
                      ),
                      new Image.asset(
                        'images/flutter_black.png',
                        color: Colors.white,
                        width: 100.0,
                        height: 100.0,
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(8.0),
                      ),
                      Center(
                        child: new Text(
                          'Welcome to FlutterEgypt.',
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: new Text(
                          '\nLogin to see our coming events and our posts.',
                          style: new TextStyle(color: Colors.white),
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.all(65.0),
                      ),
                    ],
                  ),
                  color: Colors.blue[500],
                ),
                clipper: BottomWaveClipper(),
              ),
              new Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.white,
              ),
              new Container(
                child: new RaisedButton(
                  onPressed: _login,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.network(
                        'https://fr.facebookbrand.com/wp-content/uploads/2016/05/FB-fLogo-Blue-broadcast-2.png',
                        width: 25.0,
                        height: 25.0,
                      ),
                      new Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      new Text(
                        "Login With Facebook",
                        style: new TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  color: new Color.fromARGB(255, 59, 89, 152),
                  padding: EdgeInsets.all(14.0),
                ),
                padding: EdgeInsets.all(20.0),
              ),
            ]),
      ),
    );
  }
}
