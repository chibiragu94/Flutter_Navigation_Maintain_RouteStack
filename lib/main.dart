
import 'dart:async';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'sharedPrefference.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation sample',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      // ignore: missing_return
      onGenerateRoute: (RouteSettings settings){
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context)=> MyHomePage());
            break;
          case '/second':
            return MaterialPageRoute(builder: (context)=> SecondPage());
            break;
          case '/third':
            return MaterialPageRoute(builder: (context)=> ThirdPage());
            break;
          case '/fourth':
            return MaterialPageRoute(builder: (context)=> FourthPage());
            break;
          case '/first':
            return MaterialPageRoute(builder: (context)=> FirstPage());
            break;
        }
      },
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: new Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {

  TextEditingController userNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: (
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Name'
                    ),
                    controller: userNameController,
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: (
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Password'
                    ),
                    obscureText: true,
                  )
              ),
            ),
            RaisedButton(
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () {
                /// set value as user logged In
                SharedPreferencesHelper.addBoolToSF(PrefferenceConstants.IS_USER_LOGGED_IN,true);

                /// Navigate to First Route by replacing the current Route
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:
                        (context) => FirstPage()
                    )
                );
              },
              child: Text('Log In'),
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
    Navigator.pushNamed(context, '/third');
            },
            child: Text('Third'),
          ),
          RaisedButton(
            onPressed: () {
    Navigator.pushNamed(context, '/fourth');
            },
            child: Text('Fourth'),
          ),
          RaisedButton(
            onPressed: () {
              SharedPreferencesHelper.removeValues(PrefferenceConstants.IS_USER_LOGGED_IN);

              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (route) => false);
            },
              child: Text('Log OUT')
          )
        ],
      ),
    );
  }
}

class FourthPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fourth'),
      ),
      body: new Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => FirstPage()), (route) => false);
          },
          child: Text('Go Back to First Screen by clearing the stack'),
        ),
      ),
    );
  }

}

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First'),
      ),
      body: new Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          child: Text('Second'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();

    ///Get value of user logged in from shared prefference
    SharedPreferencesHelper.getBoolValuesSF(PrefferenceConstants.IS_USER_LOGGED_IN).then((value) => {
    Timer(Duration(seconds: 5), ()=>
    {
    if (value) {
    Navigator.pushReplacement(context,
    MaterialPageRoute(builder:
    (context) => FirstPage()
    )
    )
    } else {
    Navigator.pushReplacement(context,
    MaterialPageRoute(builder:
    (context) => LoginPage()
    )
    )
    }
    }
    )
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
              size: 50.0,
            ),
           Text('Splash Screen', style: TextStyle(color: Colors.white,
               fontSize: 40, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}

