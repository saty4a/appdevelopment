import 'package:hive/hive.dart';
import 'cart.dart';

class Boxes{
  static Box<Cart>getCart()=>
      Hive.box<Cart>('cart');
}