import 'package:flutter/material.dart';
import 'package:flutter_app/state_experiments/common/models/catalog.dart';
import 'package:flutter_app/state_experiments/common/widgets/cart_button.dart';
import 'package:flutter_app/state_experiments/common/widgets/product_square.dart';
import 'package:flutter_app/state_experiments/common/widgets/theme.dart';
import 'package:flutter_app/state_experiments/src/bloc/bloc_cart_page.dart';

import 'cart_bloc.dart';
import 'cart_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CartProvider(
        child: MaterialApp(
      title: 'Bloc',
      theme: appTheme,
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        BlocCartPage.routeName: (context) => BlocCartPage()
      },
    ));
  }
}

/// The sample app's main page
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartBloc = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
        actions: <Widget>[
          StreamBuilder<int>(
            stream: cartBloc.itemCount,
            initialData: 0,
            builder: (context, snapshot) => CartButton(
              itemCount: snapshot.data,
              onPressed: () {
                Navigator.of(context).pushNamed(BlocCartPage.routeName);
              },
            ),
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}

/// Displays a tappable grid of products
class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartBloc = CartProvider.of(context);
    return GridView.count(
      crossAxisCount: 2,
      children: catalog.products.map((product) {
        return ProductSquare(
          product: product,
          onTap: () {
            cartBloc.cartAddition.add(CartAddition(product));
          },
        );
      }).toList(),
    );
  }
}
