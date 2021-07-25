import 'package:hive/hive.dart';
part 'cart.g.dart';

@HiveType(typeId: 0)
class Cart extends HiveObject{
  @HiveField(0)
  late String productname;

  @HiveField(1)
  late int quantity;

  static var length;
}