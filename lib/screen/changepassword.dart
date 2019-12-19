import 'package:parking_app/resource/parking_app_theme.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String _confirmPassword;
  String _newpassword;
  String _oldPassword;
  String _errorMessage;
  VoidCallback onBackPress;
  final _oldpswdfocus = FocusNode();
  final _newpswdfocus = FocusNode();
  final _confirmpsdfocus = FocusNode();

  bool _blackVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: new AppBar(
        //title: new Text('Manage Account'),
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
                  "Manage Account",
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
                    'OLD PASSWORD',
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
              _oldpswdInput(),
              SizedBox(height: 15),
              new Container(
                padding: EdgeInsets.only(left: 20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'NEW PASSWORD',
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
              _showNewPasswordInput(),
              SizedBox(height: 10),
              new Container(
                padding: EdgeInsets.only(left: 20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'CONFIRM PASSWORD',
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
              _showConfirmPasswordInput(),
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
                        // background: Paint()..color = Colors.blue,
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
    );
  }

  Widget _showConfirmPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.visiblePassword,
        autofocus: false,
        obscureText: true,
        textInputAction: TextInputAction.done,
        focusNode: _confirmpsdfocus,
        onFieldSubmitted: (v) {
          // FocusScope.of(context).requestFocus(phonefocus);
          _confirmpsdfocus.unfocus();
        },
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(16.0),
              ),
            ),
            hintText: 'Confirm Password',
            suffixIcon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) =>
            value.isEmpty ? 'Confirm password can\'t be empty' : null,
        onSaved: (value) => _confirmPassword = value.trim(),
      ),
    );
  }

  Widget _oldpswdInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        autofocus: true,
        textInputAction: TextInputAction.next,
        focusNode: _oldpswdfocus,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(_newpswdfocus);
        },
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(16.0),
              ),
            ),
            hintText: 'Old password',
            suffixIcon: new Icon(
              Icons.lock_outline,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Name can\'t be empty' : null,
        onSaved: (value) => _oldPassword = value.trim(),
      ),
    );
  }

  Widget _showNewPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        autofocus: false,
        textInputAction: TextInputAction.next,
        focusNode: _newpswdfocus,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(_confirmpsdfocus);
        },
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(16.0),
              ),
            ),
            hintText: 'New password',
            suffixIcon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _newpassword = value.trim(),
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
            ) /*new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
           // color: Colors.blue,

            child: new Text('Submit',
              style: DesignCourseAppTheme.title
                //new TextStyle(fontSize: 20.0, color: Colors.white),
              //onPressed: _validateAndSubmit,
            ),
          ),*/
            ));
  }
}
