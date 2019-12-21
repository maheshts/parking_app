
import 'package:flutter/material.dart';
import 'package:parking_app/model/vehiclelist.dart';
import 'package:parking_app/resource/parking_app_theme.dart';

class AddVehicleDialog extends StatefulWidget {
  @override
  _AddDialogState createState() => _AddDialogState();
}

class _AddDialogState extends State<AddVehicleDialog> {


  int _selectedIndex = 0;
  String registratioNo = "";

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){_showDialog();});
  }

  _showDialog() async{
    await showDialog<String>(
      context: context,
      builder: (BuildContext context){
        int selectedRadio = 0;
        return AlertDialog(
          backgroundColor: Colors.amber,
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(

                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 5),
                  child: Column(

                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text('ADD VEHICLE',style: ParkingAppTheme.title,),
                    SizedBox(height: 10),


                    new TextField(
                      autofocus: true,
                      keyboardType: TextInputType.text,

                      decoration: new InputDecoration(
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(20.0),

                          ),
                        ),
                        hintText: 'VEHICLE REGISTRATION NO.',
                      ),
                      onChanged: (value) {
                        registratioNo = value;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    new Container(

                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'SELECT MODEL',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            letterSpacing: 0.17,
                            color: ParkingAppTheme.darkerText,
                          ),
                        ),
                      ),
                    ),


                    Container(
                      //padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                      height: 90,
                      width: MediaQuery.of(context).size.width-50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: VehicleList.homeList.length,
                          itemBuilder: (context, index) {
                            //vehicledata:VehicleList.homeList[index];
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                              //width: 90,

                              //child: RaisedButton(
                              //color: Colors.transparent,
                              child: InkWell(

                                child: Container(
                                       decoration: BoxDecoration(
                                color:Colors.transparent,
                                shape: BoxShape.circle,

                                   border: _selectedIndex != null &&
                                      _selectedIndex == index
                                      ? Border.all(
                                    color: ParkingAppTheme.nearlyBlack,
                                    width: 2,
                                  ):Border.all(
                                    color: Colors.transparent,
                                    //width: 3,
                                  ),
//
                              ),
                                    child: Container(
                                      margin: EdgeInsets.only(left: 8,right: 8),

                                      alignment: Alignment(0, 0),
                                      child: Stack(
                                        children: <Widget>[
                                          Column(

                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                           // mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: <Widget>[

                                              //Image.asset(vehicleDetails[index]['image_url'],
                                              Image.asset(
                                                  VehicleList
                                                      .homeList[index].imagePath,
                                                  height: 36,
                                                  width: 36,
                                                  fit: BoxFit.fill),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(VehicleList
                                                  .homeList[index].vehicle_name,style: ParkingAppTheme.subtitle,),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  // Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 16.0),)),
                                ),
                                onTap: () {
                                  setState(() {
                                    _onSelected(index);
                                  });
                                },
                              /* onPressed: (){
                                 setState(() {
                                   _onSelected(index);
                                 });
                               },*/
                              ),
                            );
                          }),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 140,right: 10,top: 20),
                      child:
                    new RaisedButton(
                      color: ParkingAppTheme.nearlyBlack,

                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Add",style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 0.17,
                        color: ParkingAppTheme.nearlyWhite,
                      ),),
                    ),
                    ),

                ],),
                ),
              );
            },
          ),
        );
      },
      barrierDismissible: false,
    );
  }


  @override
  Widget build(BuildContext context) {



    String registrationNo;
    return new Container();


      /*Scaffold(
      body:Container(
        margin: EdgeInsets.all(32),
        child:Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new TextField(
            autofocus: true,
            *//* decoration: new InputDecoration(
                      labelText: 'Team Name', hintText: 'eg. Juventus F.C.'),*//*
            decoration: new InputDecoration(

              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(24.0),
                ),
              ),
              hintText: 'VEHICLE REGISTRATION NO.',

            ),

            onChanged: (value) {
              registrationNo = value;
            },
          ),

          SizedBox(height: 10,),

          new Container(
            //padding: EdgeInsets.only(left: 20.0),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                'SELECT MODEL',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  letterSpacing: 0.17,
                  color: ParkingAppTheme.darkerText,
                ),
              ),
            ),
          ),
          Container(
            //padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            margin: EdgeInsets.only(left: 10, right: 5),
            height: 150,
            width: 250,

            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: VehicleList.homeList.length,
                //itemCount: 2,
                itemBuilder: (context, index) {
                  //vehicledata:VehicleList.homeList[index];
                  return Container(
                    width: 105,
                    child: InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                            color: _selectedIndex != null &&
                                _selectedIndex == index
                                ? ParkingAppTheme.grey
                                .withOpacity(0.1)
                                : Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.white,
                                  //offset: const Offset(1.1, 1.1),
                                  blurRadius: 16.0),
                            ],
                          ),
                          child: Center(
                            child: Stack(
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    //Image.asset(vehicleDetails[index]['image_url'],
                                    Image.asset(
                                        "assets/images/bike.png",
                                        height: 50,
                                        fit: BoxFit.fill),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(VehicleList.homeList[index].vehicle_name),
                                  ],
                                ),
                              ],
                            ),
                          )
                        // Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 16.0),)),
                      ),
                      onTap: () {
                        setState(() {
                          _onSelected(index);
                        });
                      },
                    ),

                  );
                }),
          ),
      ],),
      ),
    );*/
  }
}
