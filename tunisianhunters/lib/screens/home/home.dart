import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tunisianhunters/screens/home/edit_form.dart';
import 'package:tunisianhunters/services/auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:tunisianhunters/services/database.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tunisianhunters/screens/home/reports_list.dart';
import 'package:tunisianhunters/models/rep.dart';




class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showEditPanel() {
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
        child: EditForm(),
      );
    });
    }
    return StreamProvider<List<Rep>>.value(
      value: DatabaseService().reports,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
                onPressed:() => _showEditPanel() ,
                icon: Icon(Icons.edit),
                label: Text(''))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bb.png'),
              fit: BoxFit.cover,

            )
          ),
            child: ReportsList()
        ),
      ),
    );
  }
}