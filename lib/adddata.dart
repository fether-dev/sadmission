import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

var selectedDate = DateTime.now();
var formatter = new DateFormat('yyyy-MM-dd');
var formatted = formatter.format(selectedDate);

/*var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  String formatted = formatter.format(now);
  print(formatted); // something like 2013-04-20 */
class _AddDataState extends State<AddData> {
    Future _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101)
        );
        //var formatter1 = new DateFormat('yyyy-MM-dd');
var formatted1 = formatter.format(picked);
   // if (picked != null && picked != selectedDate)
   /*print('picked');
   print(formatted1);
  print('selectedDate');
   print(formatted);*/
   if (formatted1 != null && formatted1 != formatted)
      setState(() {
         formatted= formatted1;
        // selectedDate=formatted1 as DateTime;
     });
  }
  TextEditingController controllerSname = new TextEditingController();
  TextEditingController controllerFname = new TextEditingController();
  //TextEditingController controllerDept = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerGender = new TextEditingController();
  TextEditingController controllerCont = new TextEditingController();
  TextEditingController controllerAddress = new TextEditingController();
 void addData(){
  var url="https://fluttertest.000webhostapp.com/insert.php";

    http.post(url, body: {
      "name": controllerSname.text,
      "fname": controllerFname.text,
      "dept": dropdownValue,
      "email": controllerEmail.text,
      "gender": gender,
      "contact": controllerCont.text,
      "address": controllerAddress.text,
      "dob": formatted
    });
    print('url passed ');
   print('formatted-'+ formatted);
   print(dropdownValue);
   }
   
 String v1= 'male';
 String v2= 'female';
 String v3= 'others';
 String gender;
 String dropdownValue;
  @override

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ADD DATA"),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
              new TextField(
                          controller: controllerSname,
                          decoration: new InputDecoration(
                               icon: const Icon(Icons.person),
                                labelText: "Enter StudentName",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),),
                              
                        ),
                        SizedBox(height: 10.0,),
                    new TextField(
                          controller: controllerFname,
                          decoration: new InputDecoration(
                               icon: const Icon(Icons.person),
                             labelText: "Enter FatherName",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),),
                        ),
                         SizedBox(height: 10.0,),            
              
                        new TextField(
                          controller: controllerEmail,
                          decoration: new InputDecoration(
                              icon: const Icon(Icons.email),
                           labelText: "Enter Email",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),),
                        ),
                         SizedBox(height: 10.0,),
                new TextField(
                  controller: controllerCont,
                  decoration: new InputDecoration(
                      
                     labelText: "Enter Contact",
                        fillColor: Colors.white,
                        icon: const Icon(Icons.phone),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                            color  :  Color(0x301687),//0xAARRGGBB
                          ),
                        ),),
                ),
                     SizedBox(height: 10.0,),
                new TextField(
                  controller: controllerAddress,
                  decoration: new InputDecoration(
                      icon: const Icon(Icons.add_location),
                    labelText: "Enter Address",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),),
                ), SizedBox(height: 10.0,),
         new Text('Select Department'),
          DropdownButton<String>(
          value: dropdownValue,
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          //items: <String>['One', 'Two', 'Free', 'Four']
          items: <String>['Civil', 'Cs/It', 'Ece', 'Eee', 'Mech']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
              
            );
          }).toList(),
        ),
         
                Text(
            'Genger',
            textAlign: TextAlign.start,
          ),

        new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: v1,
                          groupValue: gender,
                          onChanged: (value) {
                    setState(() {
                      gender = value;
                      print(gender);
                    });
                  },
                        ),
                        new Text(
                          'Male',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        new Radio(
                          value: v2,
                          groupValue: gender,
                          onChanged: (value) {
                    setState(() {
                      gender = value;
                      print(gender);
                    });
                  },
                        ),
                        new Text(
                          'Female',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        new Radio(
                          value: v3,
                          groupValue: gender,
                          onChanged: (value) {
                    setState(() {
                      gender = value;
                      print(gender);
                    });
                  },
                        ),
                        new Text(
                          'Others',
                          style: new TextStyle(fontSize: 16.0),
                        ),

                        ],),
                  /*    RadioListTile<String>(
                   title: const Text('Male',textAlign: TextAlign.start,
                      ),
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                      print(gender);
                    });
                  },
                ),
        RadioListTile<String>(
          title: const Text('Female',),
          value: 'Female', 
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value;
              print(gender);
            });
          },
        ),
         RadioListTile<String>(
          title: const Text('Others'),
          value: 'Others', 
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value;
              print(gender);
            });
          },
        ),*/
                //),
                  
    new IconButton(
           iconSize: 35.0, icon: new Icon( Icons.date_range,),
              onPressed: () =>_selectDate(context),
            ),
           Text("${formatted}"),
           //Text('formatted'),
          // Text('formatted.toString(): $formatted', style: TextStyle(fontSize: 18.0)),
       // Text("${formatted}"),
                  new Padding(
                      padding: new EdgeInsets.all(8.0),
                    ),
                    new Divider(height: 5.0, color: Colors.black),
                    new Padding(
                      padding: new EdgeInsets.all(8.0),
                    ),
                new RaisedButton(
                  child: new Text("ADD ADMISSION"),
                  color: Colors.deepOrange,
                  onPressed: () {
                    addData();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}