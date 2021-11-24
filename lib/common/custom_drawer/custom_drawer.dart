import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_bar/common/custom_drawer/custom_drawer_header.dart';
import 'package:food_bar/common/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [const Color(0xfffacdcd), const Color(0xffffffff)])),
          ),
          ListView(
            children: [
              CustomDrawerHeader(),
              const Divider(),
              DrawerTile(iconData: CupertinoIcons.home, title: 'Inicio', page: 0,),
              DrawerTile(iconData: CupertinoIcons.list_bullet, title: 'Produtos', page: 1),
              DrawerTile(iconData: CupertinoIcons.book, title: 'Meus Pedidos', page: 2),
              DrawerTile(iconData: Icons.location_on, title: 'Pontos de Venda', page: 3),
            ],
          ),
        ],
      ),
    );
  }
}
