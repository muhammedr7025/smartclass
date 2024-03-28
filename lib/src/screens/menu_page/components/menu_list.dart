import 'package:domus/src/screens/menu_page/components/list_tile.dart';
import 'package:domus/src/screens/stats_screen/stats_screen.dart';
import 'package:flutter/material.dart';
import 'package:domus/config/size_config.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //MenuListItem is custom tile in list_tile file
        MenuListItems(
          iconPath: 'assets/icons/menu_icons/stats.svg',
          itemName: 'Stats',
          function: () => Navigator.of(context).pushNamed(
            StatsScreen.routeName,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        MenuListItems(
          iconPath: 'assets/icons/menu_icons/faq.svg',
          itemName: 'FAQ',
          function: () {},
        ),
      ],
    );
  }
}
