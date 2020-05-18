import 'package:flutter_app/state_experiments/common/models/cart.dart';
import 'package:flutter_app/state_experiments/common/models/cart_item.dart';
import 'package:flutter_app/state_experiments/common/models/product.dart';
import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model {
  final _cart = Cart();

  List<CartItem> get items => _cart.items;

  int get itemCount => _cart.itemCount;

  void add(Product product) {
    _cart.add(product);
    notifyListeners();
  }
}
