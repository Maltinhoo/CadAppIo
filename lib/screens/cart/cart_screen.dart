import 'package:flutter/material.dart';
import 'package:food_bar/common/price_card.dart';
import 'package:food_bar/models/cart_manager.dart';
import 'package:food_bar/screens/cart/components/cart_tile.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [const Color(0xffff0000), const Color(0xff520202)])),
        ),
        title: const Text(
          'Carrinho',
        ),
      ),
      body: Consumer<CartManager>(
        builder: (_, cartManager,__){
          return ListView(
            children: [
              Column(
                children: cartManager.items.map(
                        (cartProduct) => CartTile(cartProduct))
                    .toList(),
              ),
              PriceCard(
                buttonText: 'Continuar para Entrega',
                onPressed: cartManager.isCartValid ? (){}
                : null,
              ),
            ],
          );
      },),
    );
  }
}
