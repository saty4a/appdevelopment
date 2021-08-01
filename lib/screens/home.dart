import 'dart:convert';

import 'package:ecommerce/models/item.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/models/response.dart';
import 'package:ecommerce/services/api.dart';
import 'package:ecommerce/widgets/carticon.dart';
import 'package:ecommerce/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   bool isList = false;
  /* var getData; */
  @override
  void initState() {
    super.initState();
  }

  late Widget gridview;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        title: //Icon(Icons.home),
            Container(
          child: Padding(
            padding: EdgeInsets.only(left: 120.0),
            child: Row(
              children: <Widget>[
                Text(
                  "SkillKart",
                  style: TextStyle(
                    //appbar title
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
        actions: <Widget>[
                  CartIcon(),//shopping cart
                ]
      ),
      body: Container(
        child: FutureBuilder<Response>(
            future: Api.getProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Response response = snapshot.data!;
                List<Product> products =
                    productFromJson(jsonEncode(response.data));
                /* gridview = Gv(
                  products: products,
                  /* onChanged: (bool value) {
                    value = true;
                  }, */
                ); */
                return //GestureDetector
                    Container(
                        child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 30.0),
                              child: Text(
                                "View",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                            Container(
                              //alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(left: 220.0),
                              child: GestureDetector(
                                onTap: () {
                                setState(() {
                                  /* gridview = Lv(
                                    products: products,
                                  ); */
                                  isList = false;
                                });
                              },
                                child: Icon(
                                  Icons.apps, //grid view icon
                                ),
                                /* onPressed: () {
                                  setState(() {
                                    gridview = Gv(
                                      products: products,
                                      /* onChanged: (bool value) {
                                        value = false;
                                      }, */
                                    );
                                  });
                                }, */
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 10),
                                //margin: EdgeInsets.only(top: 30.0),
                                child: GestureDetector(
                                  onTap: () {
                                setState(() {
                                  /* gridview = Lv(
                                    products: products,
                                  ); */
                                  isList = true;
                                });
                              },
                              child: Icon(
                                Icons.format_list_bulleted, //list view icon
                              ),
                            )),
                          ],
                        )),
                    Expanded(
                      child: Container(
                        child: isList ? Lv(products: products,) : Gv(products: products,), 
                        //gridview,
                      ),
                    ),
                  ],
                ));
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: new CircularProgressIndicator());
            }),
      ),
    );
  }
}
class Gv extends StatelessWidget {
  //const Gv({Key? key}) : super(key: key);
/* 
  @override
  _GvState createState() => _GvState();
}

class _GvState extends State<Gv> { */
  Gv({required this.products, /* this.active = false, required this.onChanged */
  });
  final List<Product> products;

  /* final bool active;
  final ValueChanged<bool> onChanged;
  void call() => onChanged(!active); */
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            var product = products[index];
            return GestureDetector(
              child: 
              Card(
                color: Colors.blue[800],
                child:
                Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 2,
                    offset: Offset(4, 4),
                  )
                ],
                  ),
                child: Image(
                  image: NetworkImage(product.image),
                  //fit: BoxFit.cover,
                ),
              ),
                /* elevation: 2.0,
                margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(13.0),
                ), */
                
              ),
              onTap: () {
                /* setState(() {
                      gridview = productdetails(products: products);
                    }); */
                //active ? productdetails(products: product): Gv(products: products, onChanged:(bool value) { value = false;}, );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => productdetails(products: product) //Cartdetails()
                  ),
                );
              },
            );
          }),
      margin: EdgeInsets.only(left: 7.0, right: 10.0),
    );
  }
}

class Lv extends StatelessWidget {
  //const Lv({Key? key}) : super(key: key);
  Lv({required this.products});
  final List<Product> products;
/* 
  @override
  _LvState createState() => _LvState();
}

class _LvState extends State<Lv> { */
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[800],
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          var product = products[index];
          return new GestureDetector(child:
          Container(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      offset: Offset(4, 4),
                    )
                  ],
                  ),
                height: 150,
                //color: Colors.white,
                //width: MediaQuery.of(context).size.width * 0.55,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Image(
                          width: 150,
                          image: NetworkImage(product.image),
                        ),
                        padding: EdgeInsets.only(left: 10),
                      ),
                      Expanded(child:
                      new Column(
                        //mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 30.0, top: 20.0),
                            child: Text(
                              "\$ ${product.name}",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          /* Container(
                            margin: EdgeInsets.only(top: 5.0, left: 30.0),
                            child: new Text(
                              "\$ ${product.description}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ), */
                          Container(
                            margin: EdgeInsets.only(top: 30.0, left: 30.0),
                            child: new Text(
                              "\$ ${product.price}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                      )
                    ],
                  ),
              ),
              elevation: 2.0,
              margin: EdgeInsets.all(7.0),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(7.0),
              ),
            ),
            margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
          ),
          onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => productdetails(products: product) //Cartdetails()
                  ),
                );
              },
          );
        },
      ),
    );
  }
}

class productdetails extends StatefulWidget {
  const productdetails({Key? key, required this.products}) : super(key: key);
  final Product products;
  @override
  _productdetailsState createState() => _productdetailsState();
}

class _productdetailsState extends State<productdetails> {
  addItemToCart() async {
    final cartBox = Hive.box("cart");
    print(cartBox.containsKey(widget.products.id));
    if (cartBox.containsKey(widget.products.id)) {
      Item item = await cartBox.get(widget.products.id);
      item.quantity += 1;
      await cartBox.put(widget.products.id, item);
    } else {
      await cartBox.put(
        widget.products.id,
        Item(product: widget.products, quantity: 1),
      );
    }
    CustomToast.showToast("Added to cart");
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child:
    Container(
      color: 
      Colors.blue[800],
      child: 
      Card(
        color: Colors.white,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 25.0),
                alignment: Alignment.center,
                child: Image(
                  image: NetworkImage(widget.products.image),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 30.0, left: 20.0),
                child: Text(
                  widget.products.name,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.0),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20.0, top: 5.0),
                child: Text(
                  widget.products.description,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 20.0),
                child: Text(
                  "\$${widget.products.price}",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: "RobotoBold",
                      fontSize: 25.0,
                      color: Colors.pink),
                ),
              ),
              Container(
                //height: 0,
                child: ElevatedButton(
                  onPressed: () async {
                    /* Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartScreen()),
                    ); */
                    addItemToCart();
                  },
                  child: Container(
                    //alignment: Alignment.center,
                    color: Colors.blue[800],
                    //height: 30.0,
                    width: double.infinity,
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                    alignment: Alignment.center,
                    //padding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                ),
                margin: EdgeInsets.only(left: 30.0, top: 60.0, right: 30.0),
                //padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
              ),
              Container(
                //height: 0,
                //color: Colors.white,
                child: ElevatedButton(
                  onPressed: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()),);
                  },
                  child: Container(
                    //alignment: Alignment.center,
                    color: Colors.yellow,
                    //height: 0.0,
                    width: double.infinity,
                    child: Text(
                      "Buy now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                    alignment: Alignment.center,
                    //padding: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                ),
                margin: EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 0.0, bottom: 50.0),
                //padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
              ),
              //),
            ],
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
    )
    );
  }
}
