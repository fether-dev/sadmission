import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './editdata.dart';
import './main.dart';  

class Details extends StatefulWidget{
  List list;
  int index;
  Details({this.index, this.list});
      @override
      _DetailsState createState() => _DetailsState();

    }
    class _DetailsState extends State<Details>{
        void deleteData(){
  var url="http://192.168.122.1/sphp/delete.php";
  http.post(url, body: {
    'id': widget.list[widget.index]['id']
  });
        }
      void confirm (){
  AlertDialog alertDialog = new AlertDialog(
    content: new Text("Are You sure want to delete '${widget.list[widget.index]['id']}'"),
    actions: <Widget>[
      new RaisedButton(
        child: new Text("OK DELETE!",style: new TextStyle(color: Colors.black),),
        color: Colors.red,
        onPressed: (){
          deleteData();
          Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context)=> new Home(),
            )
          );
        },
      ),
      new RaisedButton(
        child: new Text("CANCEL",style: new TextStyle(color: Colors.black)),
        color: Colors.green,
        onPressed: ()=> Navigator.pop(context),
      ),
    ],
  );
  showDialog(context: context, child: alertDialog);
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['id']}")),
      body: new Container(
        height: 270.0, 
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[

                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text(widget.list[widget.index]['id'], style: new TextStyle(fontSize: 20.0),),
                new Text("id: ${widget.list[widget.index]['id']}", style: new TextStyle(fontSize: 18.0),),
                new Text("name : ${widget.list[widget.index]['name']}", style: new TextStyle(fontSize: 18.0),),
                new Text("FatherName : ${widget.list[widget.index]['fname']}", style: new TextStyle(fontSize: 18.0),),
                new Text("contact : ${widget.list[widget.index]['contact']}", style: new TextStyle(fontSize: 18.0),),
                
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("EDIT"),
                      color: Colors.green,
                      onPressed: ()=>Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>new EditData(list: widget.list, index: widget.index,),
                        )
                      ),
                    ),
                    new RaisedButton(
                      child: new Text("DELETE"),
                      color: Colors.red,
                      onPressed: ()=>confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}