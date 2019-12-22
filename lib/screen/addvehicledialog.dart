
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

  ScrollController scrollController;

  Future<bool> _hardwareBack(BuildContext context) {
    return Future.value(false);
  }


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
                  controller: scrollController,
                  padding: EdgeInsets.only(top: 5),
                  child: Column(

                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text('ADD VEHICLE',style: ParkingAppTheme.title,),
                    SizedBox(height: 10),


                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: new TextField(
                      autofocus: true,
                      keyboardType: TextInputType.text,

                      decoration: new InputDecoration(
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(8.0),

                          ),
                        ),
                        hintText: 'VEHICLE REGISTRATION NO.',
                        contentPadding: EdgeInsets.symmetric(vertical: 8.0,horizontal:12.0),
                      ),
                      onChanged: (value) {
                        registratioNo = value;
                      },
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                    new Container(

                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Select Model',
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(color: Colors.black54),
                        ),
                      ),
                    ),


                    Container(
                      //padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                      height: 120,
                      width: MediaQuery.of(context).size.width-50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: VehicleList.homeList.length,
                          itemBuilder: (context, index) {
                            //vehicledata:VehicleList.homeList[index];
                            return Container(
                              //child: RaisedButton(
                              //color: Colors.transparent,
                              child: InkWell(

                                child: Container(
                                 // height: 90,
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
                                       // height: 85,
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
                                                  height: 30,
                                                  width: 30,
                                                  fit: BoxFit.fill),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(VehicleList
                                                  .homeList[index].vehicle_name,style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle
                                                  .copyWith(color: Colors.black54),),
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
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 12,top: 8.0,bottom: 8.0),
                      child: RaisedButton(
                        color: Colors.black,
                        child: Text("Add ",style: Theme.of(context).textTheme.subtitle.copyWith(color: Colors.white)),
                        shape: new RoundedRectangleBorder(
                          borderRadius:
                          new BorderRadius.circular(30.0),),
                        onPressed: (){
                          print("Hi");
                        },
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



  }
}
