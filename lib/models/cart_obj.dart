import 'package:syboard/ui/product_preview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartObj {
  static _createCart(instance) {
    if (instance.getStringList("cart") == null) {
      instance.setStringList("cart", <String>[]);
      instance.setStringList("cartAmount", <String>[]);
    }
  }

  static Future<List<List<String>>> getItems() async {
    var instance = await SharedPreferences.getInstance();
    _createCart(instance);
    List<List<String>> result = [instance.getStringList("cart")!, instance.getStringList("cartAmount")!];
    return result;
  }

  static Future addItem(String pid) async {
    var instance = await SharedPreferences.getInstance();
    _createCart(instance);
    var basket = instance.getStringList("cart")!;
    var basketAmount = instance.getStringList("cartAmount")!;
    if (await isInCart(pid)) {
      int position = basket.indexOf(pid);
      int amount = int.parse(basketAmount[position]) + 1;
      print(amount);
      basketAmount[position] = amount.toString();
    } else {
      basket.add(pid);
      basketAmount.add("1");
    }
    instance.setStringList("cart", basket);
    instance.setStringList("cartAmount", basketAmount);
  }

  static Future removeItem(String pid) async {
    var instance = await SharedPreferences.getInstance();
    var basket = instance.getStringList("cart");
    var basketAmount = instance.getStringList("cartAmount")!;
    int position = basket!.indexOf(pid);
    basket.remove(pid);
    basketAmount.removeAt(position);
    instance.setStringList("cart", basket);
    instance.setStringList("cartAmount", basketAmount);
  }

  static Future<bool> isInCart(String pid) async {
    var instance = await SharedPreferences.getInstance();
    _createCart(instance);
    var basket = instance.getStringList("cart");
    return basket!.contains(pid);
  }
}
