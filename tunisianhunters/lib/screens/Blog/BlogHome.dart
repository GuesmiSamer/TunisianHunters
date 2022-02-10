import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tunisianhunters/screens/Blog/Create-Blog.dart';

class Blog extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hunters",style:
            TextStyle(
                fontSize: 22
            ),),
            Text("Blog",style:
            TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),)
          ],
        ),
      ),
      body:
      Container(
        margin: EdgeInsets.only(bottom: 16),
        height: 150,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                "assets/kef.jpg",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 170,
              decoration: BoxDecoration(
                  color: Colors.black45.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(6)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Kef ABBED",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "interesting place",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text("By :Samer")
                ],
              ),
            )
          ],
        ),
    ),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> createBlog()));
              },
              backgroundColor: Colors.green,
              child: Icon(Icons.add),
            ),
          ],),
      ),
    );
  }
}
