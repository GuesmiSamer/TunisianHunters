import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunisianhunters/models/user.dart';
import 'package:tunisianhunters/services/database.dart';
import 'package:tunisianhunters/shared/constants.dart';
import 'package:tunisianhunters/shared/loading.dart';
import 'package:intl/intl.dart';

class EditForm extends StatefulWidget {
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  var now = new DateTime.now();
  final _formKey = GlobalKey<FormState>();

  // form values
  String _currentName;
  String _currentSeen;
  String _currentCollected;
  String _currentWounded;
  String _currentComments;
  DateTime _currentDate;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<Userdata>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          Userdata userData = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 5.0),
                TextFormField(
                  initialValue: userData.name,
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                  onChanged: (val) => setState(() => _currentName = val),
                ),
                SizedBox(height: 5.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Vues',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (val) => val.isEmpty ? 'Please enter the number of animals seen' : null,
                  onChanged: (val) => setState(() => _currentSeen = val),
                ),
                SizedBox(height: 5.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Blessés',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (val) => val.isEmpty ? 'Please enter the number of animals wounded' : null,
                  onChanged: (val) => setState(() => _currentWounded = val),
                ),
                SizedBox(height: 5.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Collectés',
                  ),
                    keyboardType: TextInputType.number,
                  validator: (val) => val.isEmpty ? 'Please enter the number of animals collected' : null,
                  onChanged: (val) => setState(() => _currentCollected= val),
                ),
                SizedBox(height: 10.0),
                RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        await DatabaseService(uid: user.uid).updateUserData(

                          _currentWounded ?? snapshot.data.wounded,
                          _currentSeen ?? snapshot.data.seen,
                          _currentCollected ?? snapshot.data.collected,
                          now ?? snapshot.data.date,
                          _currentName ?? snapshot.data.name,
                          _currentComments ?? snapshot.data.comments,

                        );
                        Navigator.pop(context);
                      }
                    }
                ),
              ],
            ),
          );
        } else { return Loading();
        }
      }
    );
  }
}