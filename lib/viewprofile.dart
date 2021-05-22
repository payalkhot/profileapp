import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewProfile extends StatefulWidget {
  ViewProfile({Key key, this.name, this.header}) : super(key: key);
  String name;
  Map header;
  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  String FirstName = '';
  String LastName = '';
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<SharedPreferences> _lastname = SharedPreferences.getInstance();
  SharedPreferences prefs;
  SharedPreferences lastname;
  getValue() async {
    prefs = await _prefs;
    lastname = await _lastname;

    setState(() {
      FirstName = prefs.containsKey("fname") ? prefs.getString("fname") : "";
      LastName = prefs.containsKey("ltname") ? prefs.getString("ltname") : "";
    });

    @override
    void initState() {
      getValue();
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 100,
              child: Container(
                width: 200,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                  ),
                ),
              ),
            ),
            Container(
              width: 350,
              height: 250,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue[600],
                      Colors.blue[800],
                    ],
                  ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(80),
                ),
              ),
            ),

            Positioned(
              top: 250,
              child: Container(
                width: 200,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 125,
              top: 195,
              child: CircularProfileAvatar(
                '',

                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.orange[300],
                ),
                elevation: 10,
                radius: 60,
              ),
            ),
            Positioned(
              left: 135,
              top: 330,
              child: Text(
                  'Welcome',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.grey[900],
              ),
            ),),
            Center(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(widget.header['auth'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                )),
            Positioned(
              bottom: 20,
              left: 70,
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.blue[600],
                ),
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Lets Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),),
          ],
        ),
      ),
    );
  }
}
