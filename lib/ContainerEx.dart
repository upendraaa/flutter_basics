import 'package:flutter/material.dart';
import 'package:flutter_basics/AddEmployeeSample.dart';
import 'package:flutter_basics/GetExample.dart';
import 'ListItems.dart';
import 'AddEmployeeSample.dart';
import 'GetExample.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Fields in a Widget subclass are always marked "final".

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row is a horizontal, linear layout.
      child: Row(
        // <Widget> is the type of items in the list.
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.green,),
            tooltip: 'Navigation menu',
            onPressed:()=> Navigator.of(context).pop(),
          ),
          // Expanded expands its child to fill the available space.
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void openListExample() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Namer()));
    }

    void openNetwork() {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>GetExample()));
    }
    void imageCaching() {}
    void a() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AddEmplyoee()));

    }
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          Container(
            width: double.infinity,
             margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text("List Example"),
                  onPressed: openListExample)),
          Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text("Network"),
                  onPressed: openNetwork)),
          Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text("Image Caching"),
                  onPressed: imageCaching)),
          Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text("Sample"),
                  onPressed: a)),
          Expanded(
            child: Center(
              child: Text('Hello, world!'),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Container Example",
      home: MyScaffold(),
    );
  }
}
