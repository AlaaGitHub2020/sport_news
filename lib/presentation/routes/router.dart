import 'package:auto_route/auto_route.dart';
import 'package:sport_news/presentation/routes/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: OnlineOfflineRoute.page, initial: true),
  ];
}
