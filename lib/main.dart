import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:github_demo_project/Screens/SecondScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Github Demo',
      theme: ThemeData(
          primarySwatch: Colors.green, primaryColorDark: Colors.greenAccent),
      home: MyHomePage(title: 'Github Demo'),
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
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: AnimatedContainer(
          // Use the properties stored in the State class.
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          // Define how long the animation should take.
          duration: Duration(seconds: 1),
          // Provide an optional curve to make the animation feel smoother.
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            setState(() {
              // Create a random number generator.
              final random = Random();

              // Generate a random width and height.
              _width = random.nextInt(300).toDouble();
              _height = random.nextInt(300).toDouble();

              // Generate a random color.
              _color = Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                1,
              );

              // Generate a random border radius.
              _borderRadius =
                  BorderRadius.circular(random.nextInt(100).toDouble());
            });
          }),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          DrawerHeader(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              child: Container(
              color: Colors.blue,
              child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://www.woolha.com/media/2019/06/buneary.jpg'))),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Sajid Shaikh',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ))
            ],
          ))),
          ListTile(
            leading: Icon(Icons.portrait),
            title: Text(
              'Item 1',
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.w400),
            ),
            contentPadding: EdgeInsets.all(10),
            onTap: () {
              Navigator.pop(context);
              _showToast("Item 1 Clicked");
            },
          ),
          ListTile(
            leading: Icon(Icons.present_to_all),
            title: Text(
              'Item 2',
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.w400),
            ),
            contentPadding: EdgeInsets.all(10),
            onTap: () {
              Navigator.pop(context);
              _showToast("Item 2 Clicked");
            },
          ),
          ListTile(
            leading: Icon(Icons.phone_android),
            title: Text(
              'Item 3',
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.w400),
            ),
            contentPadding: EdgeInsets.all(10),
            onTap: () {
              Navigator.pop(context);
              _showToast("Item 3 Clicked");
            },
          ),
          ListTile(
            leading: Icon(Icons.phone_android),
            title: Text(
              'Item 4',
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.w400),
            ),
            contentPadding: EdgeInsets.all(10),
            onTap: () {
              Navigator.pop(context);
              _showToast("Item 4 Clicked");
            },
          ),
          ListTile(
            leading: Icon(Icons.phone_android),
            title: Text(
              'Item 5',
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.w400),
            ),
            contentPadding: EdgeInsets.all(10),
            onTap: () {
              Navigator.pop(context);
              _showToast("Item 5 Clicked");
            },
          ),
          ListTile(
            leading: Icon(Icons.phone_android),
            title: Text(
              'Item 6',
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.w400),
            ),
            contentPadding: EdgeInsets.all(10),
            onTap: () {
              Navigator.pop(context);
              _showToast("Item 6 Clicked");
            },
          ),
          ListTile(
            leading: Icon(Icons.phone_android),
            title: Text(
              'Item 7',
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.w400),
            ),
            contentPadding: EdgeInsets.all(10),
            onTap: () {
              Navigator.pop(context);
              _showToast("Item 7 Clicked");
            },
          ),
          ],
      )),
    );
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SecondScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
