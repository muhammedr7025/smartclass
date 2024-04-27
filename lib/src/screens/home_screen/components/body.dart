import 'package:lumia/config/size_config.dart';
import 'package:lumia/src/screens/home_screen/components/savings_container.dart';
import 'package:lumia/src/screens/home_screen/components/weather_container.dart';
import 'package:lumia/view/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'dark_container.dart';

class Body extends StatefulWidget {
  final HomeScreenViewModel model;
  const Body({Key? key, required this.model}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
              child: WeatherContainer(model: widget.model),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(5)),
              child: SavingsContainer(model: widget.model),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                    child: DarkContainer(
                      itsOn: widget.model.isLightOn,
                      switchButton: widget.model.lightSwitch,
                      iconAsset: 'assets/icons/svg/light.svg',
                      device: 'Lightening',
                      switchFav: widget.model.lightFav,
                      isFav: widget.model.isLightFav,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                    child: DarkContainer(
                      itsOn: widget.model.isFanON,
                      switchButton: widget.model.fanSwitch,
                      iconAsset: 'assets/icons/svg/fan.svg',
                      device: 'Fan',
                      switchFav: widget.model.fanFav,
                      isFav: widget.model.isFanFav,
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
