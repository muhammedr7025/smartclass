import 'package:lumia/src/screens/favourites_screen/components/favourite_tile.dart';
import 'package:flutter/material.dart';
import 'package:lumia/view/home_screen_view_model.dart';
import 'package:lumia/src/screens/favourites_screen/components/body.dart';

class FavouriteList extends StatefulWidget {
  const FavouriteList({Key? key, required this.model}) : super(key: key);
  final HomeScreenViewModel model;
  @override
  _FavouriteListState createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  List<FavouriteTile> favs = <FavouriteTile>[];
  @override
  void initState() {
    super.initState();
    formList();
  }

  formList() {
    favs.clear();
    if (widget.model.isLightFav) {
      favs.add(
        FavouriteTile(
          itsOn: widget.model.isLightOn,
          switchFav: widget.model.lightFav,
          switchButton: widget.model.lightSwitch,
          iconAsset: 'assets/icons/svg/light.svg',
          device: 'Light',
          isFav: widget.model.isLightFav,
        ),
      );
    }
    if (widget.model.isFanFav) {
      favs.add(
        FavouriteTile(
          itsOn: widget.model.isFanON,
          switchButton: widget.model.fanSwitch,
          switchFav: widget.model.fanFav,
          iconAsset: 'assets/icons/svg/fan.svg',
          device: 'Fan',
          isFav: widget.model.isFanFav,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return favs.isEmpty
        ? const Body()
        : Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: favs.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: favs[index]);
              },
            ),
          );
  }
}
