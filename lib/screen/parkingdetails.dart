import 'package:flutter/material.dart';
import 'package:parking_app/design/dashline.dart';
import 'package:parking_app/model/vehiclelist.dart';
import 'package:parking_app/resource/parking_app_theme.dart';
import 'dart:math' as math;

class ParkingDetails extends StatefulWidget {
  String mAvailableText = "Available 133";
  String mParkingTime = "10:00 am to 01:00 pm";
  String mCapacityText = "Capacity 33";
  String mLocationText = "2.5 km from location";
  String mHeaderAddressText = "Lodha Supreme,Nehru marg,Mumbai";

  String mTotalPay = "₹265";
  String mTotal = "250";
  String mTaxamnt = "15";
  String mPrkingFess = "250";
  String mParkingDate = "22 Dec 2019";


  @override
  _ParkingDetailsState createState() => _ParkingDetailsState();
}

class _ParkingDetailsState extends State<ParkingDetails> {

  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  bool pressAttention = false;

  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
    print('index $index');
  }


  @override
  Widget build(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child:Container(
        margin: EdgeInsets.only(left: 8, right: 8, top: 34, bottom: 12),
        color: Colors.white,
        child: Column(children: <Widget>[
          _headerWidget(),
          SizedBox(height: 8.0),
          headerBelow(),
          SizedBox(height: 10),
          Divider(
            height: 5,
            color: Colors.black,
          ),
          SizedBox(height: 10),
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
          SizedBox(
            height: 10,
          ),
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(

            image: DecorationImage(

                image: AssetImage(
                  'assets/images/details_bg.png',

                ),
                fit: BoxFit.fill),
          ),
          child: new Column(
          children: <Widget>[
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                //color: Colors.blue[50],
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: new Icon(Icons.directions)

                ),
              ),
              new Container(
                // color: Colors.blue[50],
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    widget.mParkingDate,
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff838383),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),

            _textWidget1(),
            SizedBox(
              height: 4,
            ),
            _textWidget2(),

            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Parking Fee ",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2f2f2f).withOpacity(0.5),
                    ),
                  ),
                  Text(
                    widget.mPrkingFess,
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2f2f2f).withOpacity(0.94),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Tax",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ParkingAppTheme.nearlyBlack.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    widget.mTaxamnt,
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ParkingAppTheme.nearlyBlack.withOpacity(0.94),
                    ),
                  )
                ],
              ),
            ),
            Container(
              //margin: EdgeInsets.only(left:8,  8,8,8),
              margin: EdgeInsets.only(
                  left: 8, bottom: 5, right: 8, top: 12),
              child: const MySeparator(color: Colors.grey),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ParkingAppTheme.nearlyBlack.withOpacity(0.8),
                    ),
                  ),
                  Text(
                    widget.mTotal,
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: ParkingAppTheme.nearlyBlack.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ],),
        ),
          new Container(
            padding: EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "PAYMENT METHOD",
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
          paymentMehodWidget(),
          emptyCardWidget(),
          Text(
            " You don’t have any active card",

            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 14,

              color: ParkingAppTheme.darkerText.withOpacity(0.55),


            ),
          ),

          footerWidget(),
        ],),
      ),
      ),
    );
  }


  footerWidget(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children:

      <Widget>[

        Text(
            "Enter your card details",

            style: ParkingAppTheme.body2),

        SizedBox(width: 20,),

        Container(
          alignment: Alignment.center,
          width: 92,
          height: 64,
          decoration: BoxDecoration(
            color: ParkingAppTheme.grey,

            borderRadius: BorderRadius.circular(15),


            boxShadow:[BoxShadow(offset: Offset(0,3), blurRadius: 5,color: Color(0xffb7b7b7).withOpacity(0.62),)],
          ),
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[


                  Text(
                      "PAY",

                      style:TextStyle(
                        fontFamily: "Lato",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ParkingAppTheme.nearlyWhite,


                      ),
                  ),Text(
                    widget.mTotalPay,

                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ParkingAppTheme.amber,


                    ),
                  ),
                ],
              )],
          ),
        ),

      ],
    );

  }
emptyCardWidget(){
    return  Container(
      margin: EdgeInsets.all(8),
      alignment: Alignment.center,
      width: 264,
      height: 149,
      decoration: BoxDecoration(
        // color: ,
        border: Border.all(width: 1, color: ParkingAppTheme.grey,),
        borderRadius: BorderRadius.circular(19),


      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children:

        <Widget>[

          new Icon(Icons.add),
          Text('Add your card', textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: 0.17,
              // background: Paint()..color = Colors.blue,
              color:ParkingAppTheme.nearlyBlack.withOpacity(0.55),
            ),

          ),
        ],
      ),
    );
}
  paymentMehodWidget(){
    return  new Row(
      children: <Widget>[
        Container(
          //padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
          // margin: EdgeInsets.only(left: 10, right: 5),
          height: 60,
          width: screenWidth - 20,

          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: VehicleList.paymentMethod.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 105,
                  height: 50,
                  color: ParkingAppTheme.chipBackground,
                  child: InkWell(
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(5.0),

                      decoration: BoxDecoration(
                        color: _selectedIndex != null &&
                            _selectedIndex == index
                            ? Colors.amber
                        //.withOpacity(0.1)
                            : Colors.white,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(12.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.white,
                              //offset: const Offset(1.1, 1.1),
                              blurRadius: 16.0
                          ),
                        ],
                      ),
                      child: Center(
                        child: new Container(

                          margin: EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              VehicleList.paymentMethod[index]['name'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                letterSpacing: 0.17,
                                // background: Paint()..color = Colors.blue,
                                color: ParkingAppTheme.nearlyBlack,

                              ),),
                          ),
                          //),

                        ),
                      ),
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

      ],
    );
  }
  Widget _headerWidget() {

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
            Expanded(
              child: Text(
                widget.mHeaderAddressText,
                softWrap: true,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  letterSpacing: 0.17,
                  //color: ParkingAppTheme.darkerText,
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

  Widget headerBelow() {

    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      //padding: EdgeInsets.only(left: 10,right: 10),
      child: new Row(
        //mainAxisSize: MainAxisSize.min,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Text(widget.mLocationText,
                maxLines: 1,
                softWrap: false,
                textAlign: TextAlign.start,
                style: ParkingAppTheme.caption),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              widget.mCapacityText,
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
          Expanded(
            child: Text(
              widget.mAvailableText,
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
  Widget _textWidget1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
            'Parking at',
            style: ParkingAppTheme.body2
        ),
        SizedBox(width: 10),
        Text(
          widget.mLocationText,

          style: ParkingAppTheme.title,

        ),

      ],
    );
  }
  Widget _textWidget2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
            'From',
            style: ParkingAppTheme.body2
        ),
        SizedBox(width: 4),
        Text(
        widget.mParkingTime,

          style: ParkingAppTheme.title,

        ),

      ],
    );

}
}
