import 'dart:async';
import 'dart:convert';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './details.dart';
import './adddata.dart';
void main() {
  runApp(new MaterialApp(
    title: "Db check",
    home: new Home(),
  ));
}
    class Home extends StatefulWidget{
      @override
      _HomeState createState() => new _HomeState();

    }
    

class _HomeState extends State<Home> {
  
 Future<List> getData() async {
     //print('hai');
    final response = await http.get("http://192.168.122.1/sphp/select.php");
    return json.decode(response.body);
  
  }

   @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: new Text('my app bar'),
      ),
      floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add),
          onPressed: ()=>Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (BuildContext context)=> new AddData(),
          )     
      
      ),
      ),
      body: FutureBuilder<List>(
      future: getData(),
        builder: (context,snapshot){
          if(snapshot.hasError)
            print(snapshot.error);
        
        return snapshot.hasData
        ? new ItemList(
          list: snapshot.data,
        )
          :new Center(
            child: new CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=> new Details(list:list , index: i,)
              )
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['id']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("name : ${list[i]['name']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
