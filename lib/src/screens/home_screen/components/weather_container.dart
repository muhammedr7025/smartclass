import 'package:intl/intl.dart';
import 'package:lumia/config/size_config.dart';
import 'package:lumia/service/fetch_weather.dart';
import 'package:lumia/view/home_screen_view_model.dart';
import 'package:flutter/material.dart';

class WeatherContainer extends StatefulWidget {
  const WeatherContainer({Key? key, required this.model}) : super(key: key);

  final HomeScreenViewModel model;

  @override
  State<WeatherContainer> createState() => _WeatherContainerState();
}

class _WeatherContainerState extends State<WeatherContainer> {
  Map<String, dynamic>? weatherData;
  String? errorMessage;
  @override
  void initState() {
    super.initState();
    loadWeatherData();
  }

  void loadWeatherData() async {
    setState(() {
      errorMessage = null; // Reset error message on new fetch attempt
    });

    try {
      final data = await fetchWeather();
      setState(() {
        weatherData = data;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(weatherData);
    return Stack(
      children: [
        Container(
          height: getProportionateScreenHeight(100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFFFFFFFF),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenHeight(6),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(90),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Safe access using conditional access `?.` and default value `??`
                    Text(
                      '${weatherData?['main']?['temp']?.toStringAsFixed(1) ?? '26'} °C',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      '${weatherData?['weather']?.isNotEmpty == true ? weatherData!['weather'][0]['main'] : 'Not Available'}', // Assuming 'Cloudy' is static. If dynamic, apply similar null safety measures
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Text(
                      DateFormat('d MMMM yyyy').format(DateTime
                          .now()), // If this is supposed to be dynamic, ensure safe handling as above
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      'Stist, Tvm', // Assuming static. Apply null safety for dynamic values as needed
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Image.asset(
          'assets/images/weather/0.png',
          height: getProportionateScreenHeight(110),
          width: getProportionateScreenWidth(140),
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
