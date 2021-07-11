//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ecommerce/body.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class splash extends StatefulWidget {
  //const splash({ Key? key }) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

// ignore: camel_case_types
class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
      child: Body(),
      )
      )
    );
  }
}