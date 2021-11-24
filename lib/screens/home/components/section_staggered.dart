import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_bar/models/section.dart';
import 'package:food_bar/screens/home/components/item_tile.dart';
import 'package:food_bar/screens/home/components/section_header.dart';

class SectionStaggered extends StatelessWidget {
  const SectionStaggered({Key key, this.section}) : super(key: key);

  final Section section ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          SectionHeader(section: section,),
          StaggeredGridView.countBuilder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            crossAxisCount: 4,
            itemCount: section.items.length,
            itemBuilder: (_, index){
              return ItemTile(
                item: section.items[index],
              );
            },
            staggeredTileBuilder: (index) => StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
        ],
      ),
    );
  }
}
