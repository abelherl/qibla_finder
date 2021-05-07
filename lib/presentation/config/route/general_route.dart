import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qibla_finder/presentation/page/general_home.dart';
import 'package:qibla_finder/presentation/page/general_splash.dart';
import 'package:sailor/sailor.dart';
import '../route_config.dart';

class GeneralRouteConfig {
  static final List<SailorRoute> routes = [
    SailorRoute(
      name: RouteName.generalSplash,
      builder: (context, args, params) {
        return SplashPage();
      },
    ),
    SailorRoute(
      name: RouteName.generalHome,
      builder: (context, args, params) {
        return HomePage();
      },
    ),
  ];
}
