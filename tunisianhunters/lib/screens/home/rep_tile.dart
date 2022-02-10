import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunisianhunters/models/rep.dart';
class RepTile extends StatelessWidget {

  final Rep rep;
  RepTile({this.rep});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.green,
          ),
          title: Text(rep.name),
          subtitle: Text('Vues ${rep.seen} Blessés ${rep.wounded}  Collectés ${rep.collected}' ),

        ),
      ),

    );
  }
}
