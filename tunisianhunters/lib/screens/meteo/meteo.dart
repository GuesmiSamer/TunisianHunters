import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
class Home2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new Home2State();
  }

}

class Home2State extends State<Home2>{
  var clouds;
  String _img;
  String _setImage (clouds){
    switch(clouds) {
      case "few clouds": {
        _img="assets/few clouds.png";}
      break;
      case "moderate rain": {
        _img="assets/moderate rain.png";}
      break;
      case "overcast clouds": {
        _img="assets/overcast clouds.png";}
      break;
      case "clear sky": {
        _img="assets/sky is clear.png";}
      break;
      case "light rain": {
        _img="assets/light rain.png";}
      break;
      case "scattered clouds": {
        _img="assets/scattered clouds.png";}
      break;
      case "heavy intensity rain": {
        _img="assets/heavy intensity rain.png";}
      break;
      case "broken clouds": {
        _img="assets/broken clouds.png";}
      break;
      default:{_img="assets/few clouds.png";}
  }
  return _img;}

  Future<Map> getMyData() async{
    String myUrl = 'http://api.openweathermap.org/data/2.5/weather?q=Ariana&APPID=4cec10f964d862636df7958787fc5236';
    http.Response response = await http.get(myUrl);
    return json.decode(response.body);
  }

  Widget widgetMyData(){
    var temp,visibility,wind;
    DateTime sunrise,sunset;
    return new FutureBuilder(
        future: getMyData(),
        builder: (BuildContext context , AsyncSnapshot<Map> snapshot){
          if(snapshot.hasData){
            Map content = snapshot.data;
            visibility=(content['visibility'].toString())+'metres';
            wind=((content['wind']['speed'])*3.6).round();
            wind=wind.toString()+'km/h';
            temp=content['main']['temp'];
            temp=(temp-273.15).round();
            clouds=content["weather"][0]["description"];
            print(clouds);
            sunrise= DateTime.fromMillisecondsSinceEpoch(content['sys']['sunrise']*1000);
            sunset= DateTime.fromMillisecondsSinceEpoch(content['sys']['sunset']*1000);
            return new Container(
              color: Colors.green[100],
                child: new ListView(
                  children: <Widget>[
                    new ListTile(
                        subtitle:new Text("Température:"+temp.toString().split('.')[0]+"°",
                          style: TextStyle(
                            color:Colors.redAccent,
                            fontSize: 30.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        title:  new Text(content["name"],
                          style: TextStyle(
                            color:Colors.black,
                            fontSize: 40.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                          ) ,
                          textAlign: TextAlign.center,
                        ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                            image: new AssetImage(_setImage(clouds))),
                      ),
                      padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
                    ),
                    new ListTile(
                      subtitle:new Text("sunset:"+sunset.toString().split('.')[0],
                        style: TextStyle(
                          color:Colors.black,
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,

                        ) ,
                        textAlign: TextAlign.center,) ,
                      title:  new Text("sunrise:"+sunrise.toString().split('.')[0],
                        style: TextStyle(
                          color:Colors.black,
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,

                        ) ,
                        textAlign: TextAlign.center,),
                    ),
                    new ListTile(
                        subtitle:new Text("",
                          style: TextStyle(
                            color:Colors.black,
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                          ) ,
                          textAlign: TextAlign.center,),
                        title:  new Text("wind:"+wind,
                          style: TextStyle(
                            color:Colors.black,
                            fontSize: 20.0,
                            fontStyle: FontStyle.italic,
                          ) ,
                          textAlign: TextAlign.center,),
                    ),
                  ]),
            );
          }else{
            return new Container(

            );
          }

        });
  }

  void onPressBTn() async{
    Map myInfo = await getMyData();
    print(myInfo);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Weather") ,
        backgroundColor: Colors.green[400],
      ),
      body: new Container(
        color: Colors.black12,
            // alignment: Alignment.center,
            child:  widgetMyData(),
          )
    );
  }



}