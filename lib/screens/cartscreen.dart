import 'package:ecommerce/models/item.dart';
import 'package:ecommerce/models/response.dart';
import 'package:ecommerce/services/api.dart';
import 'package:ecommerce/widgets/cartitemlist.dart';
import 'package:ecommerce/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<List<Item>> getItemFromCartBox() async {
    final cartBox = Hive.box("cart");
    List<Item> item = cartBox.values.cast<Item>().toList();
    return item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cart"),
      ),
      body: SingleChildScrollView(child:
      Container(
        child: FutureBuilder<List<Item>>(
            future: getItemFromCartBox(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  return Column(
                    children: [
                      CartItemList(items: snapshot.data!),
                      Container(
                          alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.only(top: 20.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            addItemToOrder(snapshot.data!);
                          },style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20), // <-- Radius
                                  ),
                                ),
                          child: Text("Order",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text("No Items in the Cart"),
                  );
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
      ),
    );
  }

  Future<void> addItemToOrder(List<Item> items) async {
    Response response = await Api.postOrder(items);
    if (response.status) {
      CustomToast.showToast("Ordered Successfully");
      final cartBox = Hive.box("cart");
      await cartBox.clear();
      Navigator.pop(context);
    } else {
      CustomToast.showToast(response.error.toString());
    }
  }
}