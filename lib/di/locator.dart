import 'package:flutter_app_provider/remote_data_source/api_helper.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
    locator.registerLazySingleton(() => ApiHelper());
}