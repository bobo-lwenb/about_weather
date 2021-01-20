import 'package:about_weather/location/amap_location.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  AMapLocation _aMapLocation;

  @override
  void initState() {
    _setAMapLocation();
    super.initState();
  }

  @override
  void dispose() {
    _aMapLocation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _setAMapLocation() {
    AMapLocation.initAMapLocationKey();
    _aMapLocation = AMapLocation(
      locationChange: (result) {
        print(result.district);
      },
      permissionDenied: () {},
    );
    _aMapLocation.requestPermission();
  }
}
