import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String title ='';
  String priority = '';
  TextEditingController _dateTimeController = TextEditingController();
  DateTime _date = DateTime.now();

  _handDatePicker()
  async {
     DateTime? date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
    );
    if(date!=null&&date!=_date)
      {
        setState(() {
          _date = date;
        });
        _dateTimeController.text = _date.toString();
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add Tasks',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 18.0
                        ),
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(10)
                          )

                        ),
                        validator: (input)=>input!.trim().isEmpty?'Enter Task Title':null,
                        onSaved: (input) => title=input!,
                        initialValue: title,

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: 18.0
                        ),
                        decoration: InputDecoration(

                            labelText: 'Date',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )

                        ),

                        onTap: _handDatePicker(),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: 18.0
                        ),
                        decoration: InputDecoration(
                            labelText: 'Title',
                            border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(10)
                            )

                        ),
                        validator: (input)=>input!.trim().isEmpty?'Enter Task Title':null,
                        onSaved: (input) => title=input!,
                        initialValue: title,

                      ),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
