import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_bar/common/custom_drawer/custom_drawer.dart';
import 'package:food_bar/common/custom_navigation_bar/navigation_bar.dart';
import 'package:food_bar/models/home_manager.dart';
import 'package:food_bar/screens/home/components/section_list.dart';
import 'package:food_bar/screens/home/components/section_staggered.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffff0000),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(50)
          ),
          elevation: 15,
          foregroundColor: Colors.black,
          onPressed: () {
            Navigator.of(context).pushNamed('/cart');
          },
          child: const Icon(CupertinoIcons.cart_fill),
        ),
        
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xffffffff), Color(0xffa12d2d)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          CustomScrollView(slivers: [
            SliverAppBar(
                snap: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: RichText(
                    text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontWeight: FontWeight.bold),
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const TextSpan(
                              text: "Card",
                              style: TextStyle(color: Colors.black)),
                          const TextSpan(
                              text: "App",
                              style: TextStyle(color: Colors.white)),
                          const TextSpan(
                              text: "io",
                              style: TextStyle(color: Colors.black))
                        ]),
                  ),
                  centerTitle: true,
                )
            ),
            Consumer<HomeManager>(
                builder: (_, homeManager, __){
                  final List<Widget> children = homeManager.sections.map<Widget>(
                          (section){
                            switch(section.type){
                              case 'List' :
                                return SectionList(section: section,);
                              case 'Staggered' :
                                return SectionStaggered(section: section,);
                              default:
                                return Container();
                            }
                          }
                  ).toList();
                  
                  return SliverList(
                      delegate: SliverChildListDelegate(children),
                  );
                }
            )
          ]),
        ]),
    );
  }
}
