import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunisianhunters/models/user.dart';
import 'package:tunisianhunters/screens/home/home1.dart';
import 'package:tunisianhunters/screens/Authenticate//Authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return Home1();
    }

  }
}