import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_bar/models/page_manager.dart';
import 'package:provider/provider.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key key, this.iconData, this.page}) : super(key: key);

  final IconData iconData;
  final int page;

  @override
  Widget build(BuildContext context) {

    final int curPage = context.watch<PageManager>().page;

    return CurvedNavigationBar(
      backgroundColor: Color(0xffa12d2d),
      index: 0,
      height: 45,
        items: [
          Icon(CupertinoIcons.home, size: 30,),
          Icon(CupertinoIcons.list_bullet,size: 30,),
          Icon(CupertinoIcons.book,size: 30,),
          Icon(Icons.location_on,size: 30,)
        ],
      animationDuration: Duration(
        milliseconds: 200
      ),
      animationCurve: Curves.bounceInOut,
      onTap: (page){
      context.read<PageManager>().setPage(page);
    },
    );
  }
}
