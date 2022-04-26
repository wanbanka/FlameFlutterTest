import 'package:flutter/material.dart';
import 'package:mvc_application/view.dart' show AppState, AppMVC;

import 'package:flame_splash_screen/flame_splash_screen.dart';

import 'Views/HomePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends AppMVC {
  MyApp({Key? key}) : super(key: key);

  @override
  AppState createAppState() => View();
}

class View extends AppState {
  View()
      : super(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
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
            home: FlameSplashScreen(
              onFinish: (context) =>
                  Navigator.pushReplacementNamed(context, "/game"),
              theme: FlameSplashTheme.dark,
              showBefore: (context) {
                return Text("WOW");
              },
            ),
            onGenerateRoute: (RouteSettings settings) {
              var routeName = settings.name!;

              switch (routeName) {
                case "/game":
                  return MaterialPageRoute(
                      builder: (_) =>
                          HomePage(title: 'Flutter Demo Home Page'));

                  break;
                default:
              }
            });
}
