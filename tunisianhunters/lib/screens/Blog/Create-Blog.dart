import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tunisianhunters/services/crud.dart';



class createBlog extends StatefulWidget {
  @override
  _createBlogState createState() => _createBlogState();
}

class _createBlogState extends State<createBlog> {
  String authorName, title, desc;
  CrudMethods crudMethods= new CrudMethods();
  File _image;
  bool _isloading = false;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

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
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              setState(() {
                _isloading=true;
              });

            },
            child: Container(
                padding:EdgeInsets.symmetric(horizontal: 16.0),
                child: Icon(Icons.file_upload)),
          ),
        ],
      ),
      body: _isloading ? Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ) : Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: _image != null ? Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal:16.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.file(_image,fit: BoxFit.cover)),
              )  :   Container(
                margin: EdgeInsets.symmetric(horizontal:16.0),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(6),
                ),
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Icon(Icons.add_a_photo),
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
              margin: EdgeInsets.symmetric(horizontal:16.0),
              child: Column(children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintText: "Nom",),
                  onChanged: (val){
                    authorName=val;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "titre",),
                  onChanged: (val){
                    title=val;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Description",),
                  onChanged: (val){
                    desc=val;
                  },
                ),
              ],),
            )
          ],
        ),
      ),
    );
  }
}
