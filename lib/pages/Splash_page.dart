//@dart=2.9
//Packages
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
//Services
import '../services/http_services.dart';
import '../services/movies_services.dart';

//Model
import '../model/app_config.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;
  const SplashPage({Key key, this.onInitializationComplete})
      : super(key: key);
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6)).then(
      (_) => _setup(context).then(
        (_) => widget.onInitializationComplete(),
      ),
    );
  }

  Future<void> _setup(BuildContext _context) async {
    final getIt = GetIt.instance;

    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);
    getIt.registerSingleton<AppConfig>(AppConfig(
        BASE_API_URL: configData["BASE_API_URL"],
        BASE_IMAGE_API_URL: configData["BASE_IMAGE_API_URL"],
        API_KEY: configData["API_KEY"]));
    getIt.registerSingleton<HTTPService>(
      HTTPService(),
    );
    getIt.registerSingleton<MovieService>(
      MovieService(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: Color(0xFF000000)),

      debugShowCheckedModeBanner: false,
      title: "moviesmania",
      // theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                
                image: AssetImage("assets/images/splash_screen.gif"),
                fit: BoxFit.cover,
              ),
            ),
            // child: Image(
            //   image:DecorationImage()
            // //  image: AssetImage("assets/images/unnamed.png"),
            // image: NetworkImage('https://i.pinimg.com/originals/43/3d/83/433d83f7e481f35245f8c6bb7c7591d8.gif',),
            //   height: 500,
            // ),
          ),

          // Avoid this thing
          // I have changed the splash screen
          // don't worry , it works as similar as the instuctor screen
          // Container(
          //   height: 200,
          //   width: 200,
          //   child: Text("Never Give Up"),

          //   // decoration: BoxDecoration(

          //   //   // image: DecorationImage(
          //   //   //   fit: BoxFit.contain,
          //   //   //   image: AssetImage('assets/images/screen.png'),
          //   //   // ),
          //   // ),
          // ),
        ),
      ),
    );
  }
}
