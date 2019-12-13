import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parking_app/model/vehiclelist.dart';
import 'package:parking_app/resource/parking_app_theme.dart';
import 'dart:math' as math;

class ParkingForm extends StatefulWidget {
  @override
  _ParkingFormState createState() => _ParkingFormState();
}
_ParkingFormState _globalState = new _ParkingFormState();



class _ParkingFormState extends State<ParkingForm> {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  Color color;
  bool changeColor = false;
  static const String mAvailableText = "Available 133";
  static const String mCapacityText = "Capacity 33";
  static const String mLocationText = "2.5 km from location";
  static const String mHeaderAddressText = "Lodha Supreme,Nehru marg,Mumbai";

  String mFromTime = "12.00";
  String mToTime = "12.30";
  String mCloseTime = "12.50";
  var todayDate;
  DateTime mDate = new DateTime.now();


  String _dateval = '';
  int _n = 0;



  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   }


  @override
  Widget build(BuildContext context) {
    _dateval = formatDate(mDate);
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    return new Scaffold(
      body:

      SingleChildScrollView(

        child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 34),
    decoration: new BoxDecoration(
    color: ParkingAppTheme.notWhite,
    borderRadius: new BorderRadius.only(
    topLeft: const Radius.circular(40.0),
    topRight: const Radius.circular(40.0))),
    child:Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _headerWidget(),
        SizedBox(height: 8.0),
        headerBelow(),
        SizedBox(height: 10),
        Divider(
          height: 5,
          color: Colors.black,
        ),
        SizedBox(
          height: 15.0,
        ),
        new Container(
          padding: EdgeInsets.only(left: 10.0),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              'PARKING TIME',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 0.17,
                color: ParkingAppTheme.darkerText,
              ),
            ),
          ),
        ),
        timeWidget(),
        new Container(
          padding: EdgeInsets.only(left: 10.0),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              'PARKING DATE',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 0.27,
                color: ParkingAppTheme.darkerText,
              ),
            ),
          ),
        ),
        dateWidget(),
        SizedBox(
          height: 10,
        ),
        new Container(
          padding: EdgeInsets.only(left: 10.0),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              'VEHICLE TYPE',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 0.27,
                color: ParkingAppTheme.darkerText,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
          new  Row(
            children: <Widget>[
              Container(
                //padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                margin: EdgeInsets.only(left: 10, right: 5),
                height: 150,
                width: screenWidth - 150,

                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    //itemCount: vehicleDetails.length,
                    itemCount: VehicleList.homeList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 105,
                        child: Card(
                          child: InkWell(
                            child: Container(
                                decoration: BoxDecoration(
                                  color: _selectedIndex != null &&
                                      _selectedIndex == index
                                      ? ParkingAppTheme.grey
                                      .withOpacity(0.1)
                                      : Colors.white,
                                  //borderRadius: const BorderRadius.all(Radius.circular(10.0)),
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
                                              //"assets/images/bike.png",
                                              VehicleList.homeList[index].imagePath,
                                              height: 50,
                                              fit: BoxFit.fill),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          //Text(vehicleDetails[index]['vehicle_name']),
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
                        ),
                      );
                    }),
              ),
              _buildRight(),
            ],
          ),
        SizedBox(
          height: 10,
        ),
      ],
    ) ,
      ),
      ),
    );
  }


  Widget _headerWidget(){
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, top: 24),
      padding: EdgeInsets.only(
        right: 10,
      ),
      decoration: BoxDecoration(
        color: ParkingAppTheme.nearlyWhite,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: ParkingAppTheme.grey.withOpacity(0.2),
              offset: const Offset(1.1, 1.1),
              blurRadius: 8.0),
        ],
      ),
      child: Container(
        //padding: ,
        height: 50,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            //FlutterLogo(),
            Container(
              height: 50,
              width: 50,
              child: Image.asset("assets/images/map.jpeg"),
            ),

            SizedBox(width: 10.0),
            const Expanded(
              child: Text(
                mHeaderAddressText,
                softWrap: true,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  letterSpacing: 0.17,
                  //color: DesignCourseAppTheme.darkerText,
                ),
              ),
            ),

            SizedBox(width: 10.0),
            Container(
              padding: EdgeInsets.only(bottom: 4),
              child: Transform.rotate(
                angle: -math.pi / 4,
                child: Icon(Icons.send),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget headerBelow(){
    return  Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      //padding: EdgeInsets.only(left: 10,right: 10),
      child: new Row(
        //mainAxisSize: MainAxisSize.min,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Expanded(
            child: Text(mLocationText,
                maxLines: 1,
                softWrap: false,
                textAlign: TextAlign.start,
                style: ParkingAppTheme.caption),
          ),
          SizedBox(width: 10),
          const Expanded(
            child: Text(
              mCapacityText,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 0.15,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 10),
          const Expanded(
            child: Text(
              mAvailableText,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 0.15,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget timeWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTimeBoxUI('From ', _globalState.mFromTime, 'am'),
            getTimeBoxUI(' To', _globalState.mToTime, 'pm'),
            getTimeBoxUI('Closes at ', _globalState.mCloseTime, 'pm'),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
      ],
    );
  }
  Widget getTimeBoxUI(String text1, String txt2, String txt3) {
    return Container(
      height: 75,
      width: 80,
      decoration: BoxDecoration(
        color: ParkingAppTheme.nearlyWhite,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: ParkingAppTheme.grey.withOpacity(0.2),
              offset: const Offset(1.1, 1.1),
              blurRadius: 16.0),
        ],
      ),
      child: Padding(
        padding:
        const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              text1,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 10,
                letterSpacing: 0.17,
                color: ParkingAppTheme.grey,
              ),
            ),
            Text(
              txt2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 14,
                letterSpacing: 0.17,
                color: ParkingAppTheme.nearlyBlack,
              ),
            ),
            Text(
              txt3,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                letterSpacing: 0.17,
                color: ParkingAppTheme.dark_grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dateWidget(){
    return Column(
      children: <Widget>[
        SizedBox(
          //height: MediaQuery.of(context).padding.top,
            height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Material(
              child: SizedBox(
                height: 48,
                width: 68,
                child: InkWell(
                  highlightColor: Colors.grey,
                  borderRadius:
                  const BorderRadius.all(Radius.circular(8.0)),
                  onTap: () {
                    subtractDate();
                  },
                  child: Center(
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      // color: ParkingAppTheme.grey,

                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 48,
              width: screenWidth - 200,
              decoration: new BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 8,
                ),
                child: Row(
                  children: <Widget>[

                    new Text(_dateval,
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontSize: 16.0)),
                  ],
                ),
              ),
            ),
            new Material(
              child: SizedBox(
                height: 48,
                width: 68,
                child: InkWell(

                  highlightColor: Colors.grey,
                  borderRadius:
                  const BorderRadius.all(Radius.circular(8.0)),
                  onTap: () {
                    addDate();
                  },
                  child: Center(
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      // color: ParkingAppTheme.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }



  Widget footerWidget(){
    new  Row(
      children: <Widget>[
        Container(
          //padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
          margin: EdgeInsets.only(left: 10, right: 5),
          height: 150,
          width: screenWidth - 100,

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
            /*      child: Card(
                    child: InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                            color: _selectedIndex != null &&
                                _selectedIndex == index
                                ? ParkingAppTheme.grey
                                .withOpacity(0.1)
                                : Colors.white,
                            //borderRadius: const BorderRadius.all(Radius.circular(10.0)),
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
                                    Text(vehicleDetails[index]
                                    ['vehicle_name']),
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
                  ),*/
                );
              }),
        ),
        _buildRight(),
      ],
    );
  }

  Widget _buildRight() {
    return Container(
      child: new Container(
        padding: new EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.amber,
          // borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.white,
                offset: const Offset(1.1, 1.1),
                blurRadius: 16.0),
          ],
        ),
        width: 95,
        height: 140,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                //Image.asset(vehicleDetails[index]['image_url'],
                new Icon(Icons.navigate_next, size: 30.0),
                SizedBox(
                  height: 1,
                ),
                Text('Next'),
              ],
            ),
          ],
        ),
      ),
    );
  }


  void subtractDate() {
    DateTime today = new DateTime.now();
    DateTime fiftyDaysAgo = today.subtract(new Duration(days: 1));
    setState(() {

      var today = mDate;
      mDate = today.subtract(new Duration(days: 1));

      _dateval = formatDate(mDate);

    });

  }

  void addDate() {
    setState(() {
      var today = mDate;
      mDate = today.add(new Duration(days: 1));

      _dateval = formatDate(mDate);

    });

  }

  formatDate(DateTime dd) {
    print('inside');
    final df = new DateFormat('dd - MMM - yyyy');
    print(df.format(mDate));
    //return (DateTime.now().day +1).toString() ;
   // var now = new DateTime.now();

    var displaydate = df.format(dd);
    // var now1 = new DateFormat.MMMMd("en_US");
    //var ss = now.m;
   // return (DateTime.now().day).toString();
    return displaydate;
  }
}


