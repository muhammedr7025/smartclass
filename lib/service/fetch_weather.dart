import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchWeather() async {
  const url =
      'https://api.openweathermap.org/data/2.5/weather?q=trivandrum&appid=b8647cf889dfeb3ec4d22d8af07ba1c3&units=metric';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load weather data');
  }
}
