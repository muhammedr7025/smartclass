import 'package:lumia/src/screens/set_event_screen/set_event_screen.dart';
import 'package:lumia/src/screens/edit_profile/edit_profile.dart';
import 'package:lumia/src/screens/login_screen/login_screen.dart';
import 'package:lumia/src/screens/settings_screen/settings_screen.dart';
import 'package:lumia/src/screens/splash_screen/splash_screen.dart';
import 'package:lumia/src/screens/stats_screen/stats_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:lumia/src/screens/home_screen/home_screen.dart';
import 'package:lumia/src/screens/my_list_screen/my_list_screen.dart';
import 'package:lumia/src/screens/savings_screen/savings_screen.dart';

// Routes arranged in ascending order

final Map<String, WidgetBuilder> routes = {
  EditProfile.routeName: (context) => const EditProfile(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  SavingsScreen.routeName: (context) => const SavingsScreen(),
  SetEventScreen.routeName: (context) => const SetEventScreen(),
  SettingScreen.routeName: (context) => const SettingScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  StatsScreen.routeName: (context) => const StatsScreen(),
  MyListScreen.routeName: (context) => const MyListScreen()
};
