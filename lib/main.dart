//Package
// @dart=2.9
import 'package:flutter/material.dart';
// ignore: deprecated_member_use
import 'package:flutter_riverpod/all.dart';
import 'package:riverpod/riverpod.dart';
//Pages
import 'pages/Splash_page.dart';
import 'pages/main_page.dart';

void main() {
  runApp(
    SplashPage(
      onInitializationComplete: (() => runApp(
            ProviderScope(
              child: MyApp(),
            ),
          )),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'moviesmania',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext _context) => MainPage(),
      },
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}
