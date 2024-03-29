
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parking_app/resource/parking_app_theme.dart';
import 'package:parking_app/screen/addvehicledialog.dart';

class SelectVehicle extends StatefulWidget {
  @override
  _SelectVehicleState createState() => _SelectVehicleState();
}

class _SelectVehicleState extends State<SelectVehicle> {


  @override
  Widget build(BuildContext context) {
    var currentSelectedValue;
    const vehicleTypes = ["Car", "Truck", "Jeep"];


    Widget vehicleDropDown() {
      return Container(
        height: 40,
        width: MediaQuery.of(context).size.width-50,
        margin: EdgeInsets.only(left: 40, top: 80, right: 40),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
              color: Colors.blueGrey, style: BorderStyle.solid, width: 0.80),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text("Select Vehicle"),
            value: currentSelectedValue,
            isDense: true,
            onChanged: (newValue) {
              setState(() {
                currentSelectedValue = newValue;
              });
              print(currentSelectedValue);
            },
            items: vehicleTypes.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      );
    }

    return new Scaffold(
        body: Column(
      children: <Widget>[
        vehicleDropDown(),





Container(
  margin: EdgeInsets.only(top: 12.0),
  child:
        new RaisedButton(
          color: ParkingAppTheme.nearlyBlack,


          onPressed: () {
            //final String currentTeam = await _asyncInputDialog(context);
            //print("Current team name is $currentTeam");
            showDialog(
              context: context,
              builder: (_) => AddVehicleDialog(),
            );
          },
          child: Text("Add Vehicle",style: Theme.of(context).textTheme.subtitle.copyWith(color: Colors.white)),
          shape: new RoundedRectangleBorder(
            borderRadius:
            new BorderRadius.circular(30.0),),

        ),),



      ],
    ));

  }







}


