import 'package:lumia/config/size_config.dart';
import 'package:lumia/src/screens/home_screen/components/savings_container.dart';
import 'package:lumia/src/screens/home_screen/components/weather_container.dart';
import 'package:lumia/view/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'dark_container.dart';

class Body extends StatelessWidget {
  final HomeScreenViewModel model;
  const Body({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(7),
          vertical: getProportionateScreenHeight(7),
        ),
        decoration: const BoxDecoration(
          color: Color(0xFFF2F2F2),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(5)),
              child: WeatherContainer(model: model),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(5)),
              child: SavingsContainer(model: model),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                    child: DarkContainer(
                      itsOn: model.isLightOn,
                      switchButton: model.lightSwitch,
                      iconAsset: 'assets/icons/svg/light.svg',
                      device: 'Lightening',
                      switchFav: model.lightFav,
                      isFav: model.isLightFav,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                    child: DarkContainer(
                      itsOn: model.isFanON,
                      switchButton: model.fanSwitch,
                      iconAsset: 'assets/icons/svg/fan.svg',
                      device: 'Fan',
                      switchFav: model.fanFav,
                      isFav: model.isFanFav,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
