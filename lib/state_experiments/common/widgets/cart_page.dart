import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/state_experiments/common/models/cart.dart';
import 'package:flutter_app/state_experiments/common/models/cart_item.dart';
import 'package:flutter_app/state_experiments/common/utils/is_dark.dart';

class CartPage extends StatelessWidget {
  final Cart cart;

  const CartPage(this.cart);

  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: cart.items.isEmpty
          ? Center(
              child: Text(
                'Empty',
                style: Theme.of(context).textTheme.display1,
              ),
            )
          : ListView(
              children: cart.items.map((item) => ItemTile(item: item)).toList(),
            ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final CartItem item;

  const ItemTile({this.item});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: isDark(item.product.color) ? Colors.white : Colors.black);
    return Container(
      color: item.product.color,
      child: ListTile(
        title: Text(
          item.product.name,
          style: textStyle,
        ),
        trailing: CircleAvatar(
          backgroundColor: const Color(0x33FFFFFF),
          child: Text(
            item.count.toString(),
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
