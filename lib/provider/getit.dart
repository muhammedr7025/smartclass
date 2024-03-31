import 'package:lumia/service/navigation_service.dart';
import 'package:lumia/view/home_screen_view_model.dart';
import 'package:lumia/view/smart_light_view_model.dart';
import 'package:lumia/view/smart_fan_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerFactory(() => HomeScreenViewModel());
  getIt.registerFactory(() => SmartLightViewModel());
  getIt.registerFactory(() => SmartFanViewModel());
}
