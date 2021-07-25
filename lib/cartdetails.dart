import 'package:ecommerce/cart.dart';
import 'package:ecommerce/cartdialog.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'boxes.dart';

class Cartdetails extends StatefulWidget {
  //const Cartdetails(length, {Key? key}) : super(key: key);

  @override
  _CartdetailsState createState() => _CartdetailsState();
}

class _CartdetailsState extends State<Cartdetails> {
  @override

  /* void dispose(){
    Hive.close();
    super.dispose();
  } */
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  //Icon(Icons.home),
        Container(
          child :
          Padding(
            padding: EdgeInsets.only(left: 70.0),
            child:
            Row(
              children:<Widget>[
                Text("SkillKart", style: TextStyle( //appbar title
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  fontSize: 25.0,
                  color: Colors.white,
                ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder<Box<Cart>>(
        valueListenable: Boxes.getCart().listenable(),
        builder: (context,box,_){
          final cart=box.values.toList().cast<Cart>();
          return buildContent(cart);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>showDialog(context: context, builder:(context)=>cartDialog
        (onClickedDone: addcart,)),
      ),
    );
  }

  Widget buildContent(List<Cart> cart) {
    if(cart.isEmpty){
      return Center(
        child: Text(
          "Nothing added",
          style: TextStyle(fontSize: 24),
        ),
      );
    }
    else{
      return Column(
          children:[
            SizedBox(height: 24),
            Text("Your Orders",
              style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:20,
                color:Colors.green,
              ),
            ),
            SizedBox(height: 24),
            Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: cart.length,
                  itemBuilder: (BuildContext context,int index){
                    final c = cart[index];
                    return buildcart(context,c);
                  },
                )
            )
          ],
      );
    }
  }
  Widget buildcart(
      BuildContext context,
      Cart cart,
      ){
      final quantity=cart.quantity;
    return Card(
        color:Colors.white,
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal:24, vertical:8),
          title:Text(
            cart.productname,
            maxLines: 2,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
          ),
            subtitle: Text(
                "$quantity",style: TextStyle(
              color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16),
            ),
          children: [
            buildButtons(context,cart),
          ],
            ),
        );
    }
  Widget buildButtons(BuildContext context,Cart cart) => Row(
    children: [
      Expanded(child: TextButton.icon(
           label: Text('Edit'),
            icon: Icon(Icons.edit),
          onPressed: ()=>Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>cartDialog(
              cart: cart,
              onClickedDone:(productname,quantity)=>
                  editcart(cart,productname,quantity),
            ),
            ),
          ),
      ),
      ),
      Expanded(
        child: TextButton.icon(
            onPressed: ()=>deletecart(cart),
            icon: Icon(Icons.delete),
            label: Text("Delete"),
        ),
      )
    ],
    );
  Future addcart(String productname,int quantity) async {
    final cart=Cart()
        ..productname=productname
        ..quantity=quantity;
        final box = Boxes.getCart();
        box.add(cart);
  }
  void editcart(
      Cart cart,
      String productname,
      int quantity,
      ){
    cart.productname=productname;
    cart.quantity=quantity;
    cart.save();
  }
  void deletecart(Cart cart){
    cart.delete();
  }
}
