import 'package:flutter/material.dart';
import 'package:flutter_app/state_experiments/common/models/cart.dart';
import 'package:flutter_app/state_experiments/common/models/catalog.dart';
import 'package:flutter_app/state_experiments/common/widgets/cart_button.dart';
import 'package:flutter_app/state_experiments/common/widgets/cart_page.dart';
import 'package:flutter_app/state_experiments/common/widgets/product_square.dart';
import 'package:flutter_app/state_experiments/common/widgets/theme.dart';

void main() => runApp(MyApp());

final Cart _cart = Cart();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Singleton',
      theme: appTheme,
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        CartPage.routeName: (context) => CartPage(_cart)
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Singleton'),
        actions: <Widget>[
          CartButton(
            itemCount: _cart.itemCount,
            onPressed: () {
              Navigator.of(context).pushNamed(CartPage.routeName);
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(24.0),
            child: Text("Cart: ${_cart.items}"),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: catalog.products.map((product) {
                return ProductSquare(
                  product: product,
                  onTap: () => setState(() {
                    _cart.add(product);
                  }),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
