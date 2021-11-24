import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_bar/common/custom_drawer/custom_drawer.dart';
import 'package:food_bar/models/product_manager.dart';
import 'package:food_bar/screens/products/components/product_list_tile.dart';
import 'package:food_bar/screens/products/components/search_dialog.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
          elevation: 10,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color(0xffff0000),
                      const Color(0xff520202)
                    ])),
          ),
          title: Consumer<ProductManager>(
            builder: (_, productManager, __){
              if(productManager.search.isEmpty){
                return const Text('Produtos',
                  style: TextStyle(fontWeight:
                  FontWeight.bold),);
              } else {
                return LayoutBuilder(
                    builder: (_, constraints){
                      return GestureDetector(
                        onTap: ()async{
                          final search = await showDialog<String>(
                              context: context,
                              builder: (_) => SearchDialog(
                                productManager.search
                              ));
                          if (search != null){
                            productManager.search = search;
                          }
                        },
                        child: Container(
                            width: constraints.biggest.width,
                            child: Text(productManager.search, textAlign: TextAlign.center,)),
                      );
                    }
                );
              }
            },
          ),
          actions: [
            Consumer<ProductManager>(
                builder: (_, productManager,__){
                  if(productManager.search.isEmpty){
                    return IconButton(
                      icon: Icon(CupertinoIcons.search),
                      onPressed: () async{
                        final search = await showDialog<String>(
                            context: context,
                            builder: (_) => SearchDialog(
                              productManager.search
                            ));
                        if (search != null){
                          productManager.search = search;
                        }
                      },
                    );
                  } else {
                    return IconButton(
                      icon: Icon(CupertinoIcons.clear_circled_solid),
                      onPressed: () async{
                        productManager.search = '';
                      },
                    );
                  }
                }
            )
          ],
      ),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __){
          final filteredProducts = productManager.filteredProducts;
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: filteredProducts.length,
              itemBuilder: (_, index){
                return ProductListTile(filteredProducts[index]);
              }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffff0000),
        elevation: 10,
        foregroundColor: Colors.black,
        onPressed: (){
          Navigator.of(context).pushNamed('/cart');
        },
        child: Icon(CupertinoIcons.cart_fill),
      ),
    );
  }
}
