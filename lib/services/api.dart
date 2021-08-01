import 'dart:convert';
import 'package:ecommerce/models/item.dart';
import 'package:ecommerce/models/response.dart';
import 'package:ecommerce/models/responseAuth.dart';
import 'package:ecommerce/services/apiurl.dart';
import 'package:ecommerce/services/shareprefs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
//import 'item.dart';

class Api {
  static const url = BASE_URI;

  static Future<Response> getProducts() async {
    Uri endpoint = Uri.parse("$url/product");
    var response = await http.get(endpoint);
    print(response.body.toString());
    return responseFromJson(response.body);
    /* //var client = http.Client();
    var model;
    try {
      //var response = await client.get(Strings.url/product);
      Uri endpoint = Uri.parse("$url/product");
      var response = await http.get(endpoint);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        model = Response.fromJson(jsonMap);
      }
    } catch (Exception) {
      return model;
    }
    return model; */
  }

  static Future<Response> getOrders() async {
    Uri endpoint = Uri.parse("$url/orders");
    String token = await LocalSharedPreference.getToken();
    if (token.isEmpty) {
      return Future.error('User is not logged in.');
    }
    var response = await http.get(
      endpoint,
      headers: {
        "authorization": token,
      },
    );
    print("orders:" + response.body.toString());
    return responseFromJson(response.body);
  }

  static Future<Response> postOrder(List<Item> items) async {
    Uri endpoint = Uri.parse("$url/orders");
    String token = await LocalSharedPreference.getToken();
    if (token.isEmpty) return Future.error('user is not logged in.');
    Map bodyMap = {
      "products": json.decode(itemToJson(items)),
    };
    String body = json.encode(bodyMap);
    print(body);
    var response = await http.post(
      endpoint,
      headers: {"authorization": token, "content-type": "application/json"},
      body: body,
    );
    print(response.body.toString());
    return responseFromJson(response.body);
  }

  static Future<void> loginUser(User user) async {
    Uri endpoint = Uri.parse("$url/user");
    Map body = {
      "name": user.displayName ?? 'Hello',
      "email": user.email,
      "firebaseUid": user.uid
    };
    var response =
        await http.post(endpoint, body: jsonDecode(jsonEncode(body)));
    ResponseAuth responseAuth = responseAuthFromJson(response.body);
    LocalSharedPreference.setToken(responseAuth.token);
    return;
  }
}
