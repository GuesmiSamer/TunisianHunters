import 'package:folding_cell/folding_cell.dart';
import 'package:flutter/material.dart';
class Especes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffdfd4f4),
      child: ListView.builder(
          itemCount: 32,
          itemBuilder: (context, index) {
            return SimpleFoldingCell(
                frontWidget: _buildFrontWidget(index),
                innerTopWidget: _buildInnerTopWidget(index),
                innerBottomWidget: _buildInnerBottomWidget(index),
                cellSize: Size(MediaQuery.of(context).size.width, 125),
                padding: EdgeInsets.all(15),
                animationDuration: Duration(milliseconds: 300),
                borderRadius: 10,);
          }),

    );
  }
}



Widget _buildInnerTopWidget(int index) {
  return Builder(builder: (context) {
    switch(index) {
      case 0: {
        return GestureDetector(
          onTap: () {
            SimpleFoldingCellState foldingCellState =
            context.ancestorStateOfType(
                TypeMatcher<SimpleFoldingCellState>());
            foldingCellState?.toggleFold();
          },
          child:Container(
            color: Color(0xFFAED581),),
        );}

      break;
      case 1: {
        return GestureDetector(
          onTap: () {
            SimpleFoldingCellState foldingCellState =
            context.ancestorStateOfType(
                TypeMatcher<SimpleFoldingCellState>());
            foldingCellState?.toggleFold();
          },
          child:Container(
            color: Colors.red,),
        );}

      break;
      case 2: {
        return GestureDetector(
          onTap: () {
            SimpleFoldingCellState foldingCellState =
            context.ancestorStateOfType(
                TypeMatcher<SimpleFoldingCellState>());
            foldingCellState?.toggleFold();
          },
          child:Container(
              color: Colors.red,
              child: Row(children: <Widget>[
                Container(
                  child:Text(" للصيد السياحي:من 29 سبتمبر 2019  إلى 26 جانفي 2020 "),
                ),
                //Text(""),
              ])
          ),
        );}

      break;
      default: {
        return GestureDetector(
          onTap: () {
            SimpleFoldingCellState foldingCellState =
            context.ancestorStateOfType(
                TypeMatcher<SimpleFoldingCellState>());
            foldingCellState?.toggleFold();
          },
          child:Container(
            color: Colors.blue,),
        );
      }
      break;
    }});
}




Widget _buildInnerBottomWidget(int index) {
  return Builder(builder: (context) {
    switch(index) {
      case 0: {
        return GestureDetector(
          onTap: () {
            SimpleFoldingCellState foldingCellState =
            context.ancestorStateOfType(
                TypeMatcher<SimpleFoldingCellState>());
            foldingCellState?.toggleFold();
          },
          child:Container(
            color: Colors.white,
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Container(
                child: Column(
                    children: <Widget>[
                      Text("الارانب البرية",
                        style: TextStyle(
                          color:Colors.black,
                          fontSize: 30.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                        ) ,) ,

                      Text("29/09/2020-01/12/2020"),
                    ]),
              ),),
          ),
        );}
      break;
      case 2: {
        return GestureDetector(
          onTap: () {
            SimpleFoldingCellState foldingCellState =
            context.ancestorStateOfType(
                TypeMatcher<SimpleFoldingCellState>());
            foldingCellState?.toggleFold();
          },
          child:Container(
            color: Colors.white,
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Column(
                  children: <Widget>[
                    Text("من 29 سبتمبر 2019  إلى 26 أفريل  2020",
                      style: TextStyle(
                        color:Colors.black,
                        fontStyle: FontStyle.italic,
                      ) ,) ,

                    Text("بولايات توزر وقبلي وقفصة وقابس"),
                    Text(" وتطاوين وصفاقس وسيدي بوزيد فقط."),
                  ]),
            ),
          ),
        );}
      break;
      default: {
        return GestureDetector(
          onTap: () {
            SimpleFoldingCellState foldingCellState =
            context.ancestorStateOfType(
                TypeMatcher<SimpleFoldingCellState>());
            foldingCellState?.toggleFold();
          },
          child:Container(
            color: Colors.white,
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
          ),
        );}
      break;
    }});
}


Widget _buildFrontWidget(int index) {
  return Builder(
      builder: (BuildContext context) {
        switch(index) {
          case 0: {

            return Container(
                color: Color(0xffdfd4f4),
                alignment: Alignment.center,
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: const DecorationImage(
                          image: AssetImage("assets/l.jpg"),
                          fit: BoxFit.cover,
                        ),
                        color: Color(0xFFAED581),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                        onTap: () {
                          SimpleFoldingCellState foldingCellState =
                          context.ancestorStateOfType(
                              TypeMatcher<SimpleFoldingCellState>());
                          foldingCellState?.toggleFold();
                        },
                        child:Row(children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white,

                              ),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Text("الارانب البرية",
                                      style: TextStyle(
                                        color:Colors.black,
                                        fontSize: 30.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700,
                                      ) ,) ,

                                    Text("29/09/2020-01/12/2020"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],)
                    ),
                  ),
                ],)
            );}

          break;
          case 1: {

            return Container(
                color: Color(0xffdfd4f4),
                alignment: Alignment.center,
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: const DecorationImage(
                          image: AssetImage("assets/h.jpg"),
                          fit: BoxFit.cover,
                        ),
                        color: Color(0xFFAED581),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                        onTap: () {
                          SimpleFoldingCellState foldingCellState =
                          context.ancestorStateOfType(
                              TypeMatcher<SimpleFoldingCellState>());
                          foldingCellState?.toggleFold();
                        },
                        child:Row(children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white,

                              ),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Text("الحجل",
                                      style: TextStyle(
                                        color:Colors.black,
                                        fontSize: 30.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700,
                                      ) ,) ,

                                    Text("29/09/2020-01/12/2020"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],)
                    ),
                  ),
                ],)
            );}


          break;
          case 2: {

            return Container(
                color: Color(0xffdfd4f4),
                alignment: Alignment.center,
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: const DecorationImage(
                          image: AssetImage("assets/kh.jpg"),
                          fit: BoxFit.cover,
                        ),
                        color: Color(0xFFAED581),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                        onTap: () {
                          SimpleFoldingCellState foldingCellState =
                          context.ancestorStateOfType(
                              TypeMatcher<SimpleFoldingCellState>());
                          foldingCellState?.toggleFold();
                        },
                        child:Row(children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white,

                              ),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Text("الخنزير الوحشي",
                                      style: TextStyle(
                                        color:Colors.black,
                                        fontSize: 30.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700,
                                      ) ,) ,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],)
                    ),
                  ),
                ],)
            );}


          break;
          case 3:{return Container(
            color: Color(0xffdfd4f4),
            alignment: Alignment.center,
            child: Row(children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/kh.jpg"),
                      fit: BoxFit.cover,
                    ),
                    color: Color(0xFFAED581),
                  ),
                ),
              ),
              Expanded(

                flex: 2,
                child:GestureDetector(
                  onTap: () {
                    SimpleFoldingCellState foldingCellState =
                    context.ancestorStateOfType(
                        TypeMatcher<SimpleFoldingCellState>());
                    foldingCellState?.toggleFold();
                  },
                  child:Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ]),

          );

          }
          break;
          default: {
            return Container(
                color: Color(0xffdfd4f4),
                alignment: Alignment.center,
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xFFAED581),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                        onTap: () {
                          SimpleFoldingCellState foldingCellState =
                          context.ancestorStateOfType(
                              TypeMatcher<SimpleFoldingCellState>());
                          foldingCellState?.toggleFold();
                        },
                        child:Row(children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white,

                              ),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    FlatButton.icon(
                                      icon: Icon(Icons.expand_more),
                                      label: Text(''),
                                      onPressed: () {
                                        SimpleFoldingCellState foldingCellState =
                                        context.ancestorStateOfType(
                                            TypeMatcher<SimpleFoldingCellState>());
                                        foldingCellState?.toggleFold();
                                      },
                                      padding: EdgeInsets.only(top: 100.0),
                                      textColor: Colors.black12,
                                      color: Colors.white,
                                      splashColor: Colors.white.withOpacity(0.5),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],)
                    ),
                  ),
                ],)
            );
          }
          break;
        }

      }
  );}






