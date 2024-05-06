import 'package:auto_route/auto_route.dart';
import 'package:nothing_dialer/router/router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ContactListPageRoute.page, initial: true),
      ];
}
