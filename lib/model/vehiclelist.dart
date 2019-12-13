
import 'package:flutter/widgets.dart';

class VehicleList {
  VehicleList({
    this.vehicle_name,
    this.imagePath = '',
    this.mAvailableText='',
  });

  //Widget navigateScreen;
  String imagePath;
  String vehicle_name;
  String mFromTime = "12.00";
  String mToTime = "12.30";
  String mCloseTime = "12.50";
   String mAvailableText = "Available 133";


  static List<VehicleList> homeList = [
    VehicleList(
      vehicle_name: "CAR",
      imagePath: 'assets/images/fcar.png',

    ),
    VehicleList(
      vehicle_name: "BIKE",
      imagePath: 'assets/images/bike.png',

    ),
    VehicleList(
      vehicle_name: "TRUCK",
      imagePath: 'assets/images/car.jpg',

    ),
  ];


}
