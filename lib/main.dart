import 'package:flutter/material.dart';
import 'screens/map_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home Screen'),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Welcome to My Custom Map',
            style: TextStyle(fontSize: 32, color: Colors.black87,),
          ),
          SizedBox(width: 50, height: 100,),
          Text(
            'Tap the MAP ICON to move to the map screen',
            style: TextStyle(fontSize: 20, color: Colors.black87,),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GoogleMapScreen(),
          ),
        ),
        child: const Icon(Icons.location_pin),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

