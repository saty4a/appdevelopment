import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/register.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title:
            Padding(
              padding: EdgeInsets.only(left: 95.0),
            child: Text("Profile",style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
            ),
            ),
            ),
          ),

          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
            child: Container(
            child:
                Column(
               children:[
                 Container(
                   margin: EdgeInsets.only(top: 80.0),
              child:Container( child:
                CircleAvatar(
                  radius: 50,
                 foregroundColor: Colors.black,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  backgroundColor: Color(0xffE6E6E6),
                  radius: 50,
                  child: Icon(
                    Icons.person,
                        size: 80.0,
                        color: Color(0xffCCCCCC),
                  ),
                ),
              ),
              ),
                 ),
                 Container(
                   margin: EdgeInsets.only(top: 20.0,bottom: 0.0),
                   //color: Colors.blue,
                   child: Text("Not logged in",style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 20.0,
                     color: Colors.black,
                   ),),
                 //)
                 ),
                /*Expanded(
                  child:*/ Container(
                    //height: 0,

                    child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Registerpro()),);
                    },

                    child: Container(
                      //alignment: Alignment.center,
                      color: Colors.blue[800],
                      width: double.infinity,
                      child:
                    Text("Login",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18.0,
                  ),),
                      padding: EdgeInsets.only(left: 120.0),

                    ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                  ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 160),
                  ),
                //),
               ],
                ),
                //child:
                 /*Row(
                 //Column(
                   children: [
                     //Padding(padding: const EdgeInsets.only(),
                     // child:
                      Text("Not logged in",style: TextStyle(
                      fontWeight: FontWeight.bold,
              ),
              ),

                   ],
                 ),*/
                //),
            ),
            ),
              ),

    );

  }
}
