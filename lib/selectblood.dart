import 'package:flutter/material.dart';

class SelectBloodGroup extends StatefulWidget {
  final List<String> bloodGorupList;

  SelectBloodGroup(this.bloodGorupList);
  @override
  _SelectBloodGroupState createState() => _SelectBloodGroupState();
}

class _SelectBloodGroupState extends State<SelectBloodGroup> {
  String selectedBlood = "";    
  String Blood ="Blood Group";



  Future<void> showInformationDialog(BuildContext context) async{
    return await showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Center(
              child: Text(
                'BLOOD GROUP',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Container(
              width : 300.0,
              height : 100.0,
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                color: const Color(0xFFFFFF),
                borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _buildChoiceList(),
                ),
              ),
            ) ,

            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(onPressed: (){
                    setState(() {
                      Blood = selectedBlood;
                      Navigator.of(context).pop();
                    });
                  }, child: Text('Select',
                    style: TextStyle(
                      color: Colors.orange[600],
                      fontSize: 20,
                    ),)),
                  SizedBox(width: 80),
                  FlatButton(onPressed: (){

                    Navigator.of(context).pop();

                  }, child: Text('Cancel',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                    ),)),
                  SizedBox(width: 25),
                ],
              ),
            ],
          );
        }
    );
  }
  _buildChoiceList() {
    List<Widget> Bloods = List();
    widget.bloodGorupList.
    forEach((item) {
      Bloods.add(Container(
        constraints: BoxConstraints(
          minWidth:20 ,
        ),
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          backgroundColor: Colors.white,
          selectedColor: Colors.orange[600],
          label: Text(item,
            style: TextStyle(
              fontSize: 25,
              color: Colors.grey[400],
            ),),
          selected: selectedBlood == item,
          onSelected: (selected) {
            setState(() {
              selectedBlood = item;
            });
          },
        ),
      ));
    });
    return Bloods;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      child: TextFormField(
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
            labelText: Blood,
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return Blood;
          }
          return null;
        },
        onTap:()  async {
          await showInformationDialog(context);
        } ,
      ),
    );
  }

}
