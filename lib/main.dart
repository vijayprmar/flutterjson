import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(new MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.teal
  ),
  home: new HomePage(),
));

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State <HomePage>{
  List  data;
  @override
  Widget build(BuildContext context){
    return new Scaffold(
    appBar: new AppBar(
      title:  new Text("Load Json App"),
    ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle
                .of(context)
                .loadString('jsonlib/person.json'),
              builder: (context, snapshot){
                //decode json
                var mydata = json.decode(snapshot.data.toString());
                return new ListView.builder(
                    itemBuilder: (BuildContext context, int index){
                      return new Card(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            new Text("Name" + mydata[index]["name"]),
                            new Text("Age" + mydata[index]["age"]),
                            new Text("Height" + mydata[index]["height"]),
                            new Text("Gender" + mydata[index]["gender"]),
                          ],
                        ) ,
                      );
                    },
                  itemCount:  mydata == null ? 0 : mydata.length,
                );
              },
          ),
        ),
      ),
    );
  }
}
