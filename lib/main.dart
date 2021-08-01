import 'package:ecommerce/models/item.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  final appDocDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(ProductAdapter());
  /* await Hive.initFlutter();
  Hive.registerAdapter(CartAdapter());
  await Hive.openBox<Cart>('cart'); */
  runApp(MyApp());
}

/* class MyApp extends StatelessWidget {
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
  @override
  void dispose() {
    Hive.close();
    super.dispose();
 }
} */
class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  @override
  void dispose() {
    Hive.close();
    super.dispose();
 }
}