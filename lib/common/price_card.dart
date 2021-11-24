import 'package:flutter/material.dart';
import 'package:food_bar/models/cart_manager.dart';
import 'package:provider/provider.dart';

class PriceCard extends StatelessWidget {
  const PriceCard({Key key, this.buttonText, this.onPressed, }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    final cartManager = context.watch<CartManager>();
    final productsPrice = cartManager.productsPrice;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      elevation: 10,
      shadowColor: Color(0xffff0000),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Resumo do Pedido',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal'),
                Text('R\$ ${productsPrice.toStringAsFixed(2)}')
              ],
            ),
            const Divider(),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'R\$ ${productsPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Color(0xffff0000),
                    fontSize: 16
                  ),
                )
              ],
            ),
            SizedBox(height: 8,),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              color: Color(0xffff0000),
              disabledColor: Color(0xffff0000).withAlpha(100),
              textColor: Colors.white,
              onPressed: onPressed,
              child: Text(
                buttonText
              ),
            )
          ],
        ),
      ),
    );
  }
}
