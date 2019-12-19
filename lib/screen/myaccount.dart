import 'package:flutter/material.dart';
import 'package:parking_app/resource/parking_app_theme.dart';

class MyAccount extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<MyAccount> {
  String _email;
  String _name;
  String _phoneno;
  String _errorMessage;
  VoidCallback onBackPress;
  final emailfocus = FocusNode();
  final phonefocus = FocusNode();
  final namefocus = FocusNode();

  @override
  void initState() {
    super.initState();

    onBackPress = () {
      Navigator.of(context).pop();
    };
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
        /* appBar: new AppBar(
          title: new Text('Parkr'),
          backgroundColor: Colors.grey,
        ),*/
        body: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 70.0, bottom: 30.0, left: 10.0, right: 10.0),
                  child: Text(
                    "My Account",
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.amber,
                      decoration: TextDecoration.none,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "OpenSans",
                    ),
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      'NAME',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 0.17,
                        color: ParkingAppTheme.darkerText,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                _showNameInput(),
                SizedBox(height: 10),
                new Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      'EMAILADDRESS',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 0.17,
                        color: ParkingAppTheme.darkerText,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                _showEmailInput(),
                SizedBox(height: 10),
                new Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      'MOBILE NO',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 0.17,
                        color: ParkingAppTheme.darkerText,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                _showPhoneNoInput(),
                SizedBox(height: 10),
                Container(
                  //color: DesignCourseAppTheme.nearlyBlack.withOpacity(0.8),
                  margin: EdgeInsets.only(left: 36, top: 16, right: 36),
                  child: new OutlineButton(
                      //color: Colors.blue,
                      borderSide: BorderSide(color: Colors.black26),
                      child: new Text(
                        "Update",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: 0.17,
                          color: ParkingAppTheme.nearlyBlack,
                        ),
                      ),
                      onPressed: null,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        focusNode: emailfocus,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(phonefocus);
        },
        textInputAction: TextInputAction.next,
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
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        autofocus: false,
        focusNode: namefocus,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(emailfocus);
        },
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(16.0),
              ),
            ),
            hintText: 'Name',
            suffixIcon: new Icon(
              Icons.perm_identity,
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
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (v) {
          phonefocus.unfocus();
        },
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(16.0),
              ),
            ),
            hintText: 'Phone No',
            suffixIcon: new Icon(
              Icons.phone,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Phone can\'t be empty' : null,
        onSaved: (value) => _phoneno = value.trim(),
      ),
    );
  }

  Widget _showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(60.0, 25.0, 40.0, 60.0),
        child: SizedBox(
            height: 40.0,
            child: RaisedButton(
              //onPressed: _showBottomSheetCallback,
              child: Text("Open Modal"),
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
            )));
  }
}
