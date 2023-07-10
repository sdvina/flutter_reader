import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import '../hub/home_screen.dart';
import '../pages/splash.dart';
import '../viewer/viewer_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go heressss
        /// /HomeScreen is generated as HomeRoute because
        //of the replaceInRouteName property
        AutoRoute(page: SplashRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ViewerRoute.page),
      ];
}
