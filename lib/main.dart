import 'package:ecommerce/cart.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(CartAdapter());
  await Hive.openBox<Cart>('cart');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        //fontFamily: "RobotoBold",
        //visualDensity: VisualDestiny.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black),
        ),
      ),
      home: splash(),
    );
  }
}

