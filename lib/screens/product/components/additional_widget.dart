import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_bar/models/item_additional.dart';
import 'package:food_bar/models/product.dart';
import 'package:provider/provider.dart';

/*class AdditionalWidget extends StatelessWidget {

  const AdditionalWidget({this.add});
  final ItemAdditional add;

  @override
  Widget build(BuildContext context) {

    final product = context.watch<Product>();
    final selected = add == product.selectedAdditional;

    Color color;
    Icon icon;
    if(!add.hasStock) {
      color = Colors.red.withAlpha(50);
      icon = Icon(CupertinoIcons.clear, color: Colors.red.withAlpha(50),);
    } else if(selected) {
      color = const Color(0xff176f04);
      icon = Icon(CupertinoIcons.check_mark, color: Colors.black,);
    } else {
      color = Colors.grey;
      icon = Icon(CupertinoIcons.add, color: Colors.black38,);
    }

    return Visibility(
      visible: add.hasName != null,
      child: GestureDetector(
        onTap: (){
          if(add.hasStock){
            product.selectedAdditional = add;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: color
            )
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: color,
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: icon
              ),
                Container(
                  width: 160,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  add.hasName != null ?
                      add.item
                  :
                      '',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: !add.hasStock ? Colors.red.withAlpha(50) : Colors.black,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  add.hasName != null ?
                  'R\$ ${add.price.toStringAsFixed(2)}'
                      : '',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: color
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}*/
