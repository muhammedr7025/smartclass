import 'dart:math';
import 'package:lumia/provider/base_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeScreenViewModel extends BaseModel {
  //-------------VARIABLES-------------//
  int selectedIndex = 0;
  int randomNumber = 1;
  final PageController pageController = PageController();
  bool isLightOn = true;
  bool isFanON = false;
  bool lightVal = true;
  bool fanVal = true;
  bool isLightFav = false;
  bool isFanFav = false;
  final DatabaseReference _lightRef = FirebaseDatabase.instance.ref('light');
  final DatabaseReference _fanRef = FirebaseDatabase.instance.ref('fan');
  HomeScreenViewModel() {
    initFirebaseListeners();
  }
  void initFirebaseListeners() {
    _lightRef.onValue.listen((event) {
      if (event.snapshot.exists) {
        // Safely cast the value to bool using as and handle possible null
        isLightOn = event.snapshot.value as bool? ?? false;
        print(isLightOn);
        notifyListeners(); // Notify listeners to rebuild the dependent UI
      }
    });

    _fanRef.onValue.listen((event) {
      if (event.snapshot.exists) {
        // Safely cast the value to bool using as and handle possible null
        isFanON = event.snapshot.value as bool? ?? false;
        notifyListeners(); // Notify listeners to rebuild the dependent UI
      }
    });
  }

  void generateRandomNumber() {
    randomNumber = Random().nextInt(8);
    notifyListeners();
  }

  void lightFav() {
    isLightFav = !isLightFav;
    notifyListeners();
  }

  void fanFav() {
    isFanFav = !isFanFav;
    notifyListeners();
  }

  void fanSwitch() async {
    // Toggle the state of fan and update Firebase
    initFirebaseListeners();
    isFanON = !isFanON;

    await _fanRef.set(isFanON);
    notifyListeners();
  }

  void lightSwitch() async {
    // Toggle the state of light and update Firebase
    initFirebaseListeners();
    isLightOn = !isLightOn;

    await _lightRef.set(isLightOn);
    notifyListeners();
  }

  ///On tapping bottom nav bar items
  void onItemTapped(int index) {
    selectedIndex = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    notifyListeners();
  }
}
