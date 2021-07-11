import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/home.dart';
import 'package:ecommerce/homepage.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body:
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1,0.4,0.7,0.9],
              colors: [Color(0xff3594DD),
                Color(0xff4563DB),
                Color(0xff5036D5),
                Color(0xff5B16D0),],
            ),
          ),
          child: Card(
            clipBehavior: Clip.antiAlias,
            color: Colors.cyanAccent,
            child: Container(
              child: Column(
                children: [
                  Container(child: Center(
                    child: Text("SkillKart",style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                    ),),
                  ),
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Container(
                    child: Center(
                      child: Text("Login",style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),),
                    ),
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  SizedBox(height: 30.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 15.0),
                        child:
                        Text("Email",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),),),
                      SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all( Radius.circular(10.0)),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            /*prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          hintText: "Enter your Email",*/
                          ),
                        ),
                      ),
                      // for password

                      Padding(padding: EdgeInsets.only(left: 15.0,top: 10.0),
                        child:
                        Text("Password",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),),),
                      SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all( Radius.circular(10.0)),
                        ),
                        child: TextField(
                          obscureText: true,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            /*prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),*/
                            //hintText: "Enter your Password",
                          ),
                        ),
                      ),
                      //button
                      //child:
                      Padding(
                        //height: 0,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()),);
                          },
                          child: Container(
                            //alignment: Alignment.center,
                            color: Colors.blue,
                            width: double.infinity,
                            child:
                            Text("Login",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18.0,
                            ),),
                            padding: EdgeInsets.only(left: 130.0),

                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20), // <-- Radius
                            ),
                          ),
                        ),
                        padding: EdgeInsets.only(left: 20.0,right:20.0,top: 40,bottom: 0),
                      ),
                      //),*/
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          //Container(child:
                          Container(
                            margin: EdgeInsets.only(left: 80.0),
                            child: Text("Have an account? Create one"),
                            //padding: EdgeInsets.only(left: 10.0),
                          ),
                          Padding(padding: EdgeInsets.only(right: 5.0),),
                          Center(child: Expanded(
                            child:new RichText(text:  TextSpan(
                              text: "here",
                              style: new TextStyle(color: Colors.blue),
                              /*recognizer: new TapGestureRecognizer()
                                ..onTap=(){},*/
                              //textDirection: TextDirection.ltr,
                            ),
                            ),
                          ),
                          ),
                        ],
                      ),

                    ],
                  )
                ],
              ),
            ),
            elevation: 2.0,
            margin: EdgeInsets.all(2.0),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),),
          ),
          padding: EdgeInsets.only(top: 120.0,bottom: 50.0,right: 10.0,left: 10.0),
        ),
      );
  }
}
