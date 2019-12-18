import 'package:flutter/material.dart';
import 'package:parking_app/screen/parkingdetails.dart';

import 'package:parking_app/screen/parkingform.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: 'Home'),
      home: ParkingDetails(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showBottomSheetCallback() {
    _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
      return ParkingForm();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
              title: const Text('Perker')
          ),
          body: Center(
              child: RaisedButton(
                  onPressed: _showBottomSheetCallback,
                  child: Text("Open Modal"),
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.grey,
              )
          )
      ),
    );
  }
}





