import 'package:qibla_finder/presentation/config/route/general_route.dart';
import 'package:sailor/sailor.dart';

/// Route name directory
class RouteName {
  // General routes
  static const String generalSplash = '/';
  static const String generalHome="/home";
  static const String generalSettings="/settings";
}

class RouteConfig {
  // will automatically navigate which name route is '/' as the first screen. Check on Route Name constant.
  static void configureMainRoutes(Sailor router) {
    router.addRoutes(GeneralRouteConfig.routes);
  }
}
