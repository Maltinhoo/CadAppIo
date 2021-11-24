import 'package:flutter/material.dart';
import 'package:food_bar/models/product_manager.dart';
import 'package:food_bar/models/section_item.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({Key key, this.item}) : super(key: key);

  final SectionItem item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(item.product != null){
          final product = context.read<ProductManager>()
              .findProductById(item.product);
          if(product != null){
            Navigator.of(context).pushNamed('/product', arguments: product);
          }
        }
      },
      child: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: item.image,
              fit: BoxFit.cover,
            )
          )
      ),
    );
  }
}
