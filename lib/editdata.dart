import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController controllerId;
  //TextEditingController controllerName;
  TextEditingController controllerContact;

  void editData() {
    var url="https://fluttertest.000webhostapp.com/update.php";
    http.post(url,body: {
      "id": widget.list[widget.index]['id'],
      
      //"name": controllerName.text,
      "contact": controllerContact.text,
    });
  }


  @override
    void initState() {
      controllerId= new TextEditingController(text: widget.list[widget.index]['id'] );
     // controllerName= new TextEditingController(text: widget.list[widget.index]['name'] );
      controllerContact= new TextEditingController(text: widget.list[widget.index]['Contact'] );
      
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerId,
                  decoration: new InputDecoration(
                      hintText: "Id", labelText: "Id"),
                ),
                
                new TextField(
                  controller: controllerContact,
                  decoration: new InputDecoration(
                      hintText: "Contact", labelText: "Contact"),
                ),

                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("EDIT DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context)=>new Home()
                      )
                    );
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