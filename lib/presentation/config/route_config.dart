import 'package:qibla_finder/presentation/config/route/general_route.dart';
import 'package:sailor/sailor.dart';

/// Route name directory
class RouteName {
  // General routes
  static const String generalSplash = '/';
  static const String generalSetupDevice="/setup-device";
  static const String generalOnboarding = "/onboarding";
  static const String generalLogin ="/login";

  //User Routes
  static const String userStartShift="/user/start-shift";
  static const String userEndShift = "/user/end-shift";

  //Dashboard Routes
  static const String dashboard="/dashboard";
  static const String dashboardMenu="/dashboard/menu";
  static const String dashboardOrder="/dashboard/order";
  static const String dashboardReport="/dashboard/report";
  static const String dashboardShift="/dashboard/shift";
  static const String dashboardSetting="/dashboard/setting";
  static const String dashboardDetail="/dashboard/detail";
  static const String dashboardReceipt="/dashboard/receipt";
}

class RouteConfig {
  // will automatically navigate which name route is '/' as the first screen. Check on Route Name constant.
  static void configureMainRoutes(Sailor router) {
    router.addRoutes(GeneralRouteConfig.routes);
  }
}
