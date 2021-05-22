import 'package:flutter/material.dart';


class DatePicker extends StatefulWidget {
  DatePicker({Key key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final dateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return new Container(
      width: 140,
      child:TextFormField(
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
            labelText: 'Date of Birth',
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
        readOnly: true,
        controller: dateController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Select a Date';
          }



          return null;
        },
        onTap: () async {
      var date =  await showDatePicker(
          context: context,
          initialDate:DateTime.now(),
          firstDate:DateTime(1900),
          lastDate: DateTime(2100));
      dateController.text = date.toString().substring(0,10);


        },),);
  }
}