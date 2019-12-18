
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/resource/parking_app_theme.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Type your userid",
          prefixIcon: const Icon(
            Icons.person_outline,
            color: Colors.black87,
          ),
          hintStyle: TextStyle(color: Colors.grey,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w800,
            fontSize: 14,
            letterSpacing: 0.2,),

          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Type your password",
          prefixIcon: const Icon(
            Icons.lock,
            color: Colors.black87,
          ),
          hintStyle: TextStyle(color: Colors.grey,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w800,
            fontSize: 14,
            letterSpacing: 0.2,),

          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(8.0),
      color: ParkingAppTheme.amber,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        //padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        onPressed: () {},
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black87,fontSize:16, fontWeight: FontWeight.bold)),
      ),
    );

    final signupButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(8.0),
      color: ParkingAppTheme.nearlyBlack,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        //padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        onPressed: () {},
        child: Text("Signup",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontSize:16,fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      body: Container(
      color: Colors.white,
      child: Column(children: <Widget>[
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 60),

          child: Image.asset("assets/images/logo.png"),
        ),

        Container(
          margin: EdgeInsets.only(left: 4, right: 4, top: 24),
          child: new Text('Sign in with', style: ParkingAppTheme.body2),
        ),
        Container(
          margin: EdgeInsets.only(left: 4, right: 4, top: 8),
          width: screenWidth - 20,


          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              new Container(
                margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                child: new RaisedButton(
                    padding: EdgeInsets.only(
                        top: 3.0, bottom: 3.0, left: 6.0, right: 6.0),
                    color: ParkingAppTheme.nearlyWhite,
                    onPressed: () {},
                    child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Image.asset(
                          'assets/images/g.png',
                          height: 40.0,
                        ),
                        new Container(
                            padding: EdgeInsets.only(left: 12.0, right: 8.0),
                            child: new Text(" Google", style: TextStyle(
                                color: Colors.black87,
                                fontFamily: "Lato",
                                fontSize: 18,
                                fontWeight: FontWeight.bold),)
                        ),
                      ],
                    )
                ),
              ), new Container(
                margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                child: new RaisedButton(
                    padding: EdgeInsets.only(
                        top: 3.0, bottom: 3.0, left: 6.0, right: 6.0),
                    color: ParkingAppTheme.nearlyWhite,
                    onPressed: () {},
                    child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Image.asset(
                          'assets/images/f.png',
                          height: 40.0,
                        ),
                        new Container(
                            padding: EdgeInsets.only(left: 12.0, right: 8.0),
                            child: new Text("Facebook",
                              style: TextStyle(color: Colors.black87,
                                  fontFamily: "Lato",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),)
                        ),
                      ],
                    )
                ),
              ),

            ],),
        ),
      SizedBox(height: 20,),
      Divider(color: ParkingAppTheme.nearlyBlack,),
      Container(
        color: Colors.white,
        margin: EdgeInsets.only(left: 16,right: 16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              SizedBox(height: 5.0),
              emailField,
              SizedBox(height: 25.0),
              passwordField,
              SizedBox(
                height: 35.0,
              ),
             loginButon,
              SizedBox(
                height: 10.0,
              ),
             Text('or',style: ParkingAppTheme.title,),
              SizedBox(
                height: 10.0,
              ),
             signupButon,
             // loginButon,
              SizedBox(
                height: 26.0,
              ),

            ],
          ),
        ),
      ),
        _textWidget1(),
      ],
      ),
    )
    );
  }


  Widget _textWidget1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
            'Forgot Password?',
            style: ParkingAppTheme.title,
        ),
        //SizedBox(width: 5),
        Text(
          'GET NEW',
          //widget.mLocationText,

          style:  TextStyle(color: ParkingAppTheme.amber,
    fontFamily: "Lato",
    fontSize: 16,
    fontWeight: FontWeight.bold),

        ),

      ],
    );
  }
}