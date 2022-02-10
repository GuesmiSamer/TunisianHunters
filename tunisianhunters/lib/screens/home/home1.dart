import 'package:firebase_auth/firebase_auth.dart';
import 'package:tunisianhunters/screens/Blog/BlogHome.dart';
import 'package:tunisianhunters/screens/maps/map.dart';
import 'package:tunisianhunters/screens/meteo/meteo.dart';
import 'package:tunisianhunters/screens/reglementation/reg.dart';
import 'package:tunisianhunters/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:tunisianhunters/screens/home/home.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:tunisianhunters/screens/saisons/especes.dart';
import 'package:tunisianhunters/models/user.dart';
import 'package:tunisianhunters/screens/Authenticate/Profile.dart';

class Home1 extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/LOGO.png"),
                    ),
                ),
              ),
              new ListTile(
                  title: new Text("Rapport de chasse"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Home()));
                  }
              ),
              new ListTile(
                  title: new Text("weather"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Home2()));
                  }
              ),
              new ListTile(
                  title: new Text("Profile"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProfilePage()));
                  }
              ),
              new ListTile(
                  title: new Text("Blog"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Blog()));
                  }
              ),
              new ListTile(
                  title: new Text("map"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Map()));
                  }
              ),
              new ListTile(
                  title: new Text("Réglementations"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Reg()));
                  }
              ),
              new Divider(),
              new ListTile(
                title: new Text("Cancel"),
                trailing: new Icon(Icons.cancel),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        body:Especes(),
      ),
    );
  }
}


