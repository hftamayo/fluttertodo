import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> listof = [
    "Apple",
    "Orange",
    "Banana",
    "Watermelon",
    "Grapes"
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "ToDo List",
          style: new TextStyle(fontSize: 19.0),
        ),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.add), onPressed: () => debugPrint("Add")),
          new IconButton(
              icon: new Icon(Icons.search),
              onPressed: () => debugPrint("Search")),
        ],
      ),
      body: new Container(
        child: new ListView.builder(
          itemBuilder: (_, int index) => listDataItem(this.listof[index]),
          itemCount: this.listof.length,
        ),
      ),
    );
  }
}

class listDataItem extends StatelessWidget {
  String itemName;
  listDataItem(this.itemName);

  @override
  Widget build(BuildContext context) {
    return new Card(
        child: new Container(
      child: new Row(
        children: <Widget>[
          new CircleAvatar(
            child: new Text(itemName[0]),
          ),
          new Text(
            itemName,
            style: TextStyle(fontSize: 20.0),
          )
        ],
      ),
    ));
  }
}
