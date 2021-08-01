import 'package:ecommerce/models/item.dart';
import 'package:ecommerce/widgets/cartitemcard.dart';
import 'package:flutter/material.dart';
class CartItemList extends StatelessWidget {
  CartItemList({required this.items});
  final List<Item> items;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var product = items[index];
          return GestureDetector(child:
          CartItemCard(
            item: items[index],
          ),
          onTap: (){/* 
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Productdetails(products: product) //Cartdetails()
                  ),
                ); */
          },
          );
        },
      ),
    );
  }
}
