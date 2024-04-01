import 'package:firebase_auth/firebase_auth.dart';
import 'package:lumia/service/preferences_service.dart';
import 'package:lumia/src/screens/about_screen/about_us_screen.dart';
import 'package:lumia/src/screens/menu_page/components/list_tile.dart';
import 'package:lumia/src/screens/splash_screen/splash_screen.dart';
import 'package:lumia/src/screens/stats_screen/stats_screen.dart';
import 'package:flutter/material.dart';
import 'package:lumia/config/size_config.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  //signout function
  signOut() async {
    await auth.signOut();
    final preferencesService = PreferencesService();
    await preferencesService.saveLoginStatus(false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SplashScreen()));
  }

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
            function: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const AboutUs()))),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        MenuListItems(
          iconPath: 'assets/icons/menu_icons/logout.svg',
          itemName: 'Signout',
          function: () {
            signOut();
          },
        ),
      ],
    );
  }
}
