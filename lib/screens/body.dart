import 'dart:ui';
import 'package:ecommerce/screens/homepage.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Body extends StatefulWidget {
  //const Body({ Key? key }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), (){
      if(auth.currentUser==null){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login()), (route) => false);
      }else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Homepage()), (route) => false);
      }
    });
    return Center(
     child: Container(
      decoration: BoxDecoration(
      color: Colors.white,
      ),
       child: Padding (
         padding: EdgeInsets.symmetric(vertical:30.0,horizontal: 20.0),
       child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: <Widget>[
         Container(alignment: Alignment.centerRight,
         child: TextButton(
           onPressed: (){
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => Homepage()),
             );
           },
           child: Text("skip",style: TextStyle(
             color: Colors.black,
             fontSize: 20.0,
           ),),
         ),
         margin: EdgeInsets.only(top: 20.0),
         ),
          Container(
            alignment: Alignment.center,
            //margin:  EdgeInsets.symmetric(vertical: 220),
              child: Padding(
              padding: EdgeInsets.symmetric(vertical: 220.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget> [
                  Center(
                    child:
                  Text("SkillKart", style:
                  TextStyle(
                    fontFamily: "RobotoBold",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 50.0,
                  ),),
                  ),
                  //Center(
                  //SizedBox(height: 10.0),
                      Padding(
                          padding: EdgeInsets.only(left: 15.0,top: 260.0),
                        child:
                         Text("Powered by")
                      ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0,top: 30.0),
                    child:Image(image: AssetImage("assets/zairza.jpg"),),
                    )
                    ),
                  //),
                ],
            )
            )
          ),
       ],),
       )
     ));
  }
}