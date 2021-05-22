import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profileapp/datepicker.dart';
import 'package:profileapp/selectblood.dart';
import 'package:profileapp/selectgender.dart';
import 'package:profileapp/user.dart';
import 'package:profileapp/viewprofile.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'DBHelper.dart';
class CreateProfile extends StatefulWidget {


  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  List<String> genderList = [
    "Male",
    "Female"
  ];
  List<String> bloodGorupList = [
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-",

  ];



  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController number = TextEditingController();

  String FirstName='';
  String LastName='';
  String PinCode='';
  String Number='';
  String Gender='';

  var dbHelper;


  @override
  void initState() {
    super.initState();

    dbHelper = DBHelper();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top : 180,
                child: Container(
                  width: 200,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.orange[800],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                    ),
                  ),
                ),
              ),
              Positioned(
                top : 180,
                child: Container(
                  width: 200,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.orange[800],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                    ),
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 250,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.orange[700],
                        Colors.orange[800],
                      ],
                    ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(80),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(13, 40, 10, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tell us about',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text('yourself.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),),
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                    ),
                  ),
                ),
              ),
              Positioned(
                top : 250,
                child: Container(
                  width: 200,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 245,
                top: 70,
                child: CircularProfileAvatar(
                  '',
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.blue[900],
                  ),
                  elevation: 0,
                  radius: 50,
                ),
              ),
              Positioned(
                left: 315,
                top: 140,
                child: CircularProfileAvatar(
                  '',
                  child: Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.orange,
                  radius: 15,
                ),
              ),

              Positioned(
                top: 230,
                child: Padding(

                  padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
                  child: Container(
                    child: Form(
                      key: _formKey,
                      child: Scrollbar(

                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [

                                Container(
                                  width: 140,
                                  child: TextFormField(
                                    controller: firstName,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2.0),
                                        ),
                                        labelText: 'First Name',
                                        labelStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        )),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter First Name';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) => FirstName = value,
                                  ),
                                ),
                                SizedBox(width: 50),
                                Container(
                                  width: 140,
                                  child: TextFormField(
                                    controller: lastName,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2.0),
                                        ),
                                        labelText: 'Last Name',
                                        labelStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        )),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter Last Name';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) => LastName = value,

                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                DatePicker(),
                                SizedBox(width: 50),
                                SelectGender(this.genderList),
                              ],
                            ),
                            Row(

                              children: <Widget>[
                                Container(
                                  width: 140,
                                  child: TextFormField(
                                    controller: pinCode,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2.0),
                                        ),
                                        labelText: 'Pin Code',
                                        labelStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        )),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Invalid Pin Code';
                                      }

                                      return null;
                                    },
                                    onSaved: (value) => PinCode = value,

                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: <Widget>[
                                Container(
                                  width: 300,
                                  child: TextFormField(
                                    controller: number,
                                    decoration: InputDecoration(

                                        fillColor: Colors.white,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2.0),
                                        ),
                                        labelText: 'Emergency Contact Number',
                                        labelStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        )),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      if (value.length < 10) {
                                        return 'Ivalid number';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) => Number = value,

                                  ),
                                ),
                              ],
                            ),
                            
                            SelectBloodGroup(this.bloodGorupList),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Text('Allergies', style:TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),),
                                Text(''),
                                IconButton(icon: Icon(Icons.add_circle_outline_rounded,
                                  size: 30,
                                  color: Colors.white,
                                ), onPressed: null),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Text('Comorbidities', style:TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),),
                                Text(''),
                                IconButton(icon: Icon(Icons.add_circle_outline_rounded,
                                  size: 30,
                                  color: Colors.white,
                                ), onPressed: null),
                              ],
                            ),
                          ],

                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 70,
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.blue[200],
                  ),
                  child: FlatButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {

                        setState(() {
                          FirstName = firstName.text;
                          LastName = lastName.text;
                          PinCode = pinCode.text;
                          Number = number.text;
                          User e = User(null, FirstName ,LastName , PinCode , Number);
                          dbHelper.save(e);
                        });
                        Navigator.of(context).pushReplacement(                                                         //new
                            new MaterialPageRoute(                                                                       //new
                                settings: const RouteSettings(name: '/form'),                                              //new
                                builder: (context) => new ViewProfile(name: FirstName, header: {'auth': LastName}) //new
                            )                                                                                            //new
                        );

                      } else {
                        print('errors');
                      }

                    },
                    child: Text(
                      'Create Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),)
            ],

          ),
        ),
      ),
    );
  }
}
