
import 'package:qibla_finder/shared/local_device/local_device_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:qibla_finder/shared/constant_definition.dart';
import 'package:sailor/sailor.dart';

import '../config/route_config.dart';

class App {
  /// Flavor of running app
  final Flavor flavor;

  /// Router of the app
  final Sailor router;

  /// Local device data
  LocalDevice? device;

  App({
    required this.flavor,
    required this.router,
  });

  /// Helper to get main App instance, one and only
  static App get main => GetIt.instance.get<App>();

  Future<void> init() async {
    // set default orientation to portrait
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // fullscreen
//    await SystemChrome.setEnabledSystemUIOverlays([]);
    // configure routes
    RouteConfig.configureMainRoutes(router);
  }

}
