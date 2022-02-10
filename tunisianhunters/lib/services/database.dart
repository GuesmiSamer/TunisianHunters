import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tunisianhunters/models/rep.dart';
import 'package:intl/intl.dart';
import 'package:tunisianhunters/models/user.dart';


class DatabaseService {
  var now = new DateTime.now();
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference huntReportCollection = Firestore.instance.collection('reports');
  
  Future updateUserData(String wounded,String seen,String collected, DateTime date,String name,String comments) async {
    return await huntReportCollection.document(uid).setData({
      'wounded':wounded,
      'seen':seen,
      'collected':collected,
      'date':date,
      'name':name,
      'comments':comments,

    });
  }
  List<Rep> _repListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
     return Rep(
       wounded:doc.data['wounded'] ?? '0' ,
       seen:doc.data['seen'] ?? '0' ,
       collected:doc.data['collected'] ?? '0' ,
       //date:doc.data['date'] ?? now ,
       name:doc.data['name'] ?? '' ,
       comments:doc.data['comments'] ?? '' ,
     );

    }).toList();
  }

  Userdata _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return Userdata(
      uid:uid,
      wounded:snapshot.data['wounded'] ,
      seen:snapshot.data['seen']  ,
      collected:snapshot.data['collected']  ,
      //date:snapshot..data['date']  ,
      name:snapshot.data['name']  ,
      comments:snapshot.data['comments'] ,

    );
  }
  Stream<List<Rep>> get reports {
    return huntReportCollection.snapshots()
    .map(_repListFromSnapshot);
  }

  Stream<Userdata> get userData {
    return huntReportCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }
}