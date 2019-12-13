import 'package:flutter/material.dart';
import 'package:parking_app/screen/parking.dart';
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
      //home: MyHomePage(title: 'Wel come'),
      home: ParkingForm(),
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


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:  RaisedButton(
          child: Text("Open Modal"),
          onPressed: _showMyBottomSheet,
          color: Colors.blue,
          textColor: Colors.white,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          splashColor: Colors.grey,
        ),
      ),
    );



  }

  void _showMyBottomSheet(){
    // the context of the bottomSheet will be this widget
    //the context here is where you want to showthe bottom sheet
    showBottomSheet(context: context,
        builder: (BuildContext context){
          return ParkingForm(); // returns your BottomSheet widget
        }
    );
  }


}
