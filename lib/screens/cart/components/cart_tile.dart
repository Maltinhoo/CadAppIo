import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_bar/common/custom_icon_button.dart';
import 'package:food_bar/models/cart_product.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {

  const CartTile(this.cartProduct);

  final CartProduct  cartProduct;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: cartProduct,
      child: Card(
        shadowColor: Colors.black,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: Image.network(cartProduct.product.images.first),
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartProduct.prod,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17
                          ),
                        ),
                        Consumer <CartProduct>(
                            builder: (_, cartProduct, __){
                              if (cartProduct.hasStock) {
                                return Text(
                                'R\$ ${cartProduct.product.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    color: Color(0xffff0000),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              );
                              } else {
                                return const Text(
                                  'Sem Estoque Disponível',
                                  style: TextStyle(
                                    color: Color(0xffff0000),
                                    fontSize: 12,
                                  ),
                                );
                              }
                            }
                        )
                      ],
                    ),
                  )
              ),
              Consumer<CartProduct>(
                  builder: (_, cartPorduct, __){
                    return Column(
                      children: [
                        CustomIconButton(
                          iconData: CupertinoIcons.add_circled,
                          color: Color(0xff0d7205),
                          onTap: cartProduct.increment,
                        ),
                        Text(
                            '${cartProduct.quantity}',
                            style: const TextStyle(
                                fontSize: 20
                            )
                        ),
                        CustomIconButton(
                          iconData: CupertinoIcons.minus_circle,
                          color: cartProduct.quantity > 1 ? Color(0xff0d7205) :Color(0xffff0000) ,
                          onTap: cartProduct.decrement,
                        ),
                      ],
                    );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
