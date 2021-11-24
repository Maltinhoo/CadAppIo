import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_bar/common/custom_drawer/custom_drawer.dart';
import 'package:food_bar/models/page_manager.dart';
import 'package:food_bar/screens/home/home_screen.dart';
import 'package:food_bar/screens/login/login_screen.dart';
import 'package:food_bar/screens/products/products_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          ProductsScreen(),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
                elevation: 0,
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
                title: const Text('Meus Pedidos',style: TextStyle(fontWeight: FontWeight.bold),)
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
                elevation: 0,
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
                title: const Text('Pontos de Venda', style: TextStyle(fontWeight: FontWeight.bold),)
            ),
          ),
        ],
      ),
    );
  }
}
