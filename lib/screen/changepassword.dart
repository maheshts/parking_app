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
  final _formKey = GlobalKey<FormState>();

  ScrollController scrollController;

  Future<bool> _hardwareBack(BuildContext context) {
    return Future.value(false);
  }

  bool _blackVisible = false;

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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12),
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
                        padding: EdgeInsets.only(left: 12.0,top: 8),
                        child: Text(
                          'Old Password',
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(color: Colors.black54),
                        ),
                      ),

                      SizedBox(height: 5),
                      _oldpswdInput(),
                      SizedBox(height: 8),
                      new Container(
                        padding: EdgeInsets.only(left: 12.0,top: 8),
                        child: Text(
                          'New Password',
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(color: Colors.black54),
                        ),
                      ),
                      SizedBox(height: 5),
                      _showNewPasswordInput(),
                      SizedBox(height: 8),
                      new Container(
                        padding: EdgeInsets.only(left: 12.0,top: 8),
                        child: Text(
                          'Confirm Password',
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(color: Colors.black54),
                        ),
                      ),
                      SizedBox(height: 5),
                      _showConfirmPasswordInput(),
                      SizedBox(height: 16),
                      _showPrimaryButton(),



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

  Widget _showConfirmPasswordInput() {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.visiblePassword,
        autofocus: false,
        obscureText: true,
        textInputAction: TextInputAction.done,
        focusNode: _confirmpsdfocus,
        onFieldSubmitted: (v) {
          v.isEmpty ? 'Confirm password can\'t be empty' : _confirmpsdfocus.unfocus();


        },
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(8.0),
              ),
            ),
            hintText: 'Enter confirm Password',
            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
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
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        autofocus: true,
        textInputAction: TextInputAction.next,
        focusNode: _oldpswdfocus,
        onFieldSubmitted: (v) {
          v.isEmpty ? 'Name can\'t be empty' : FocusScope.of(context).requestFocus(_newpswdfocus);
        },
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(8.0),
              ),
            ),
            hintText: 'Enter old password',
            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
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
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        autofocus: false,
        textInputAction: TextInputAction.next,
        focusNode: _newpswdfocus,
        onFieldSubmitted: (v) {
          v.isEmpty ? 'Password can\'t be empty' :FocusScope.of(context).requestFocus(_confirmpsdfocus);
        },
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(8.0),
              ),
            ),
            hintText: 'Enter new password',
            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
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
    return  Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(right: 12,top: 8.0,bottom: 8.0),
      child: RaisedButton(
        color: Colors.black,
        child: Text("Save \t \u2192",style: Theme.of(context).textTheme.subtitle.copyWith(color: Colors.white),),
        shape: new RoundedRectangleBorder(
          borderRadius:
          new BorderRadius.circular(30.0),),
        onPressed: (){
          print("Hi");
        },
      ),
    );
  }
}
