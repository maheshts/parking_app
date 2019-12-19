import 'package:flutter/material.dart';
import 'package:parking_app/resource/parking_app_theme.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String _email;
  String _name;
  String _phoneno;
  String _password;
  String _errorMessage;
  VoidCallback onBackPress;
  final emailfocus = FocusNode();
  final phonefocus = FocusNode();
  final namefocus = FocusNode();
  final passwordfocus = FocusNode();

  @override
  void initState() {
    super.initState();

    onBackPress = () {
      Navigator.of(context).pop();
    };
  }



  @override
  Widget build(BuildContext context) {
    final signupButon = Material(
      elevation: 5.0,

      borderRadius: BorderRadius.circular(22.0),
      color: ParkingAppTheme.nearlyBlack,
      child: MaterialButton(
         minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        onPressed: () {},
        child: Row( // Replace with a Row for horizontal icon + text
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Register",style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: 0.17,
              color: ParkingAppTheme.nearlyWhite,
            ),),
            SizedBox(width: 10,),
            Icon(Icons.arrow_forward,color: Colors.white,),


          ],
       // Text("Signup",textAlign: TextAlign.center,
            //style: style.copyWith(color: Colors.white, fontSize:16,fontWeight: FontWeight.bold)),
      ),

      ),
    );
    return WillPopScope(
        onWillPop: onBackPress,
        child: Scaffold(
        body:
        ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 70.0, bottom: 30.0, left: 10.0, right: 10.0),
            child: Text(
              "Get Started with parker",
              softWrap: true,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.amber,
                decoration: TextDecoration.none,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
              ),
            ),
          ),
          _showNameInput(),
          SizedBox(height: 10),
          _showEmailInput(),
          SizedBox(height: 10),
          _showPhoneNoInput(),
          SizedBox(height: 10),
          _passwordInput(),
      Padding(
        padding:
        const EdgeInsets.only(left: 18.0, right: 8.0, top: 8.0, bottom: 8.0),
        child:  Row(
            children:

            <Widget>[
              Checkbox(
                  value: false,
                  onChanged: (bool newValue) {
                    setState(() {
                      //checkBoxValue = newValue;
                    });
                  }),
              Text("I accept the Terms & conditions"),
            ],
          ),
      ),


      Container(
        margin: EdgeInsets.only(left: 140,top: 20,right:15),
        width: 120,
        child: //<Widget>[
        signupButon,
            ),



    ],),
    ),);

  }


  Widget _passwordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.visiblePassword,
        autofocus: false,
        obscureText: true,
        focusNode: passwordfocus,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (v){
          passwordfocus.unfocus();
          //register();
        },
        decoration: new InputDecoration(

            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(16.0),
              ),
            ),
            hintText: 'Password',
            suffixIcon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Confirm password can\'t be empty' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        focusNode: emailfocus,
        onFieldSubmitted: (v){
          FocusScope.of(context).requestFocus(phonefocus);
        },
        decoration: new InputDecoration(

            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(16.0),
              ),
            ),
            hintText: 'Email',
            suffixIcon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget _showNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: true,
        focusNode: namefocus,
        onFieldSubmitted: (v){
          FocusScope.of(context).requestFocus(emailfocus);
        },
        textInputAction: TextInputAction.next,
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(16.0),
              ),
            ),
            hintText: 'Name',
            suffixIcon: new Icon(
              Icons.person_add,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Name can\'t be empty' : null,
        onSaved: (value) => _name = value.trim(),
      ),
    );
  }

  Widget _showPhoneNoInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.phone,
        autofocus: false,
        focusNode: phonefocus,
        onFieldSubmitted: (v){
          FocusScope.of(context).requestFocus(passwordfocus);
        },
        textInputAction: TextInputAction.next,
        decoration: new InputDecoration(

            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(16.0),
              ),
            ),
            hintText: 'Mobile No',
            suffixIcon: new Icon(
              Icons.phone,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Phone can\'t be empty' : null,
        onSaved: (value) => _phoneno = value.trim(),
      ),
    );
  }
}
