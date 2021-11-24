import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_bar/models/cart_manager.dart';
import 'package:food_bar/models/item_additional.dart';
import 'package:food_bar/models/product.dart';
import 'package:food_bar/models/product_manager.dart';
import 'package:food_bar/models/user_manager.dart';
import 'package:food_bar/screens/product/components/additional_widget.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {

    Color color;
    if(!product.hasStock) {
      color = Colors.red.withAlpha(50);
    }  else {
      color = Color(0xffff0000);
    }


    return MultiProvider(
      providers: [
      ChangeNotifierProvider<Product>.value(value: product),
      ChangeNotifierProvider(create: (_) => UserManager(), lazy: false,)
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(product.name),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            AspectRatio(
              aspectRatio: 1.1,
              child: Carousel(
                images: product.images.map((url) {
                  return NetworkImage(url);
                }).toList(),
                dotSize: 4,
                dotSpacing: 15,
                dotBgColor: Colors.transparent,
                dotIncreasedColor: const Color(0xffff0000),
                animationDuration: const Duration(milliseconds: 100),
                autoplayDuration: const Duration(seconds: 3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Preço',
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'R\$ ${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 22,
                        color: Color(0xffff0000),
                        fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Descrição',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20,),
                    Consumer2<UserManager, Product>(
                      builder: (_,userManager, product, __){
                        return SizedBox(
                          height: 44,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            onPressed: (){
                              if(userManager.isLoggedIn){
                                if(product.hasStock){
                                  context.read<CartManager>().addToCart(product);
                                  Navigator.of(context).pushNamed('/cart');
                                }
                              } else{
                                Navigator.of(context).pushNamed('/login');
                              }
                            },
                            color: color,
                            textColor: Colors.white,
                            child: Text(
                                userManager.isLoggedIn
                                    ? 'Adicionar ao Carrinho'
                                    : 'Entre para Comprar',
                              style: const TextStyle(
                                fontSize: 18
                              ),
                            )
                          ),
                        );
                      },
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
