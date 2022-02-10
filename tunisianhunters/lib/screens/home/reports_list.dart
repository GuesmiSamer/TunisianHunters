import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunisianhunters/models/rep.dart';
import 'package:tunisianhunters/screens/home/rep_tile.dart';

class ReportsList extends StatefulWidget {
  @override
  _ReportsListState createState() => _ReportsListState();
}

class _ReportsListState extends State<ReportsList> {
  @override
  Widget build(BuildContext context) {

    final reports = Provider.of<List<Rep>>(context) ?? [];
    
    return ListView.builder(
      itemCount: reports.length,
      itemBuilder: (context,index) {
        return RepTile(rep : reports[index]);
      },
    );
  }
}
