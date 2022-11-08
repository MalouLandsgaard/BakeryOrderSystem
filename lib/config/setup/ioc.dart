import 'package:bakery_order_system/config/setup/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

class IOC {
  static late final GetIt _locator;

  static Future setupMain() async {
    _locator = GetIt.instance;

    _locator.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance,
        instanceName: 'firestore');
  }

  static T injectSync<T extends Object>(String instanceName) =>
      _locator.get<T>(instanceName: instanceName);

  static Future<T> injectAsync<T extends Object>(String instanceName) async =>
      await _locator.getAsync<T>(instanceName: instanceName);
}
