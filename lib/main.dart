import 'package:flutter/material.dart';
import 'package:flutter_basics/home.dart';
import 'home.dart';
import 'ListItems.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void onLogin() {
    /*Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );*/

    Navigator.push(context, MaterialPageRoute(builder: (context) => Namer()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset("assets/images/payodalogo.jpg"),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.infinity,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'EmailId'),
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.infinity,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              width: double.infinity,
              height: 40,
              child: RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                onPressed: onLogin,
                child: Text("LogIn"),
              ),
            ),
            Container(
              margin: new EdgeInsets.only(top: 80),
              width: double.infinity,
              height: 40,
              child: Text(
                "Create new account",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
