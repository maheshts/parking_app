import 'package:flutter/material.dart';
import 'package:parking_app/model/vehiclelist.dart';
import 'package:parking_app/resource/parking_app_theme.dart';

class VehicleAdd extends StatefulWidget {
  @override
  _VehicleAddState createState() => _VehicleAddState();
}

class _VehicleAddState extends State<VehicleAdd> {
  String _selectedVehicle;
  String _selectedModel;
  String _selectedColor;
  String _regno;


  List<String> _model = ["Select a model"];
  List<String> _color = ["Select a color"];

  List<String> _modelList = ["names"];

  String _selectedState = "Choose a state";
  String _selectedLGA = "Choose ..";
  ScrollController scrollController;

  Future<bool> _hardwareBack(BuildContext context) {
    return Future.value(false);
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () => _hardwareBack(context),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: ParkingAppTheme.nearlyWhite,
            title: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
              height: 28,
            ),
            leading: IconButton(icon: Icon(Icons.arrow_back)),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications,color: Colors.black,),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.more_vert,color: Colors.black,),
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 4),
                      vehicleSelectWidget(),
                      SizedBox(height: 8),
                      modelSelectWidget(),
                      SizedBox(height:8),
                      _showNameInput(),
                      SizedBox(height:8),
                      colorSelectWidget(),

                      SizedBox(height: 16),
                      Container(
                        //alignment: Alignment.centerRight,

                        margin: EdgeInsets.only(right: 12,top: 8.0,bottom: 8.0),
                        child: RaisedButton(
                          color: Colors.amber,
                          child: Text("Add",style: Theme.of(context).textTheme.subtitle.copyWith(color: ParkingAppTheme.nearlyBlack,),),
                          shape: new RoundedRectangleBorder(
                            borderRadius:
                            new BorderRadius.circular(8.0),),
                          onPressed: (){
                            print("Hi");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget vehicleSelectWidget() {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
            color: Colors.blueGrey, style: BorderStyle.solid, width: 0.80),
      ),
      // padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      child: new DropdownButton<String>(
        isDense: true,
        isExpanded: true,
        hint: new Text("Vehicle Type"),
        value: _selectedVehicle,
        onChanged: (value) => _onSelectedVehicle(value),
        /*onChanged: (String newValue) {
          setState(() {
            _mySelection = newValue;
          });

          print(_mySelection);
        },*/
        items: VehicleList.vehicleTypes.map((Map map) {
          return new DropdownMenuItem<String>(
            value: map["id"].toString(),
            child: new Text(
              map["name"],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget  modelSelectWidget(){
    return  Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
            color: Colors.blueGrey, style: BorderStyle.solid, width: 0.80),
      ),
      // padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      child: new DropdownButton<String>(
        isDense: true,
        isExpanded: true,
        hint: new Text("Model"),
        value: _selectedModel,
        onChanged: (value) => _onSelectedModel(value),

        items: VehicleList.vehicleModel.map((Map map) {
        //items: _modelList.map((Map map) {
          return new DropdownMenuItem<String>(
            value: map["id"].toString(),
            child: new Text(
              map["name"],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _showNameInput() {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: new TextFormField(
        maxLines: 1,
       // textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            hintText: 'Enter registration number',
            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
           ),
        validator: (value) => value.isEmpty ? 'Registration can\'t be empty' : null,
        onSaved: (value) => _regno = value.trim(),
      ),
    );
  }

  Widget  colorSelectWidget(){
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
            color: Colors.blueGrey, style: BorderStyle.solid, width: 0.80),
      ),

      child: new DropdownButton<String>(
        isDense: true,
        isExpanded: true,
        hint: new Text("Color"),
        value: _selectedColor,
        onChanged: (value) => _onSelectedColor(value),

        items: VehicleList.vehicleColors.map((Map map) {
          return new DropdownMenuItem<String>(
            value: map["id"].toString(),
            child: new Text(
              map["name"],
            ),
          );
        }).toList(),
      ),
    );
  }

  void _onSelectedVehicle(String value) {
    setState(() {
      _selectedVehicle = value;
      print(_selectedVehicle.toString());
      _selectedLGA = "Select Model";
      _color = ["Select Color .."];

      //TODO retriive value according he selection _modelList
    });
  }

  void _onSelectedModel(String value) {
    setState(() {
      _selectedModel = value;
      _color = ["Select Color .."];


    });
  }

  void _onSelectedColor(String value) {
    setState(() => _selectedColor = value);
  }
}
