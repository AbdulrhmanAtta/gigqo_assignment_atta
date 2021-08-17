import 'package:flutter/material.dart';
import 'package:gigqo_assignment/screens/form.dart';
import 'dart:async';
import 'package:gigqo_assignment/model/Track.dart';
import 'package:gigqo_assignment/service/api_service.dart';
import 'package:gigqo_assignment/screens/tracks_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xff121219),
      appBar: AppBar(
        backgroundColor: Color(0xff121219),
        actions: [
           IconButton(
          icon: const Icon(Icons.music_note),
          tooltip: 'Increase volume by 10',
          onPressed: () {
               Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return TrackList( track: [],);
                                  }));
          },
        ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(image: AssetImage('assets/logo.png'), fit: BoxFit.cover, width: 170,),
          ],
        ),

      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: Image(image: AssetImage('assets/vinyl.png'), fit: BoxFit.cover, width: 170,)),
            SizedBox(height: 20),
            Text(
              'Please tab on the "+" to add tracks',
              style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:14 ),
              
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffDE1534),
        onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return AddDataWidget();
                                  }));
                                },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
