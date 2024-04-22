import 'package:order_app/modules/user/auth/sign_in_view.dart';
import 'package:order_app/modules/user/dashboard/dashboard_view.dart';
import 'package:order_app/modules/user/order/order_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    // AdaptiveRoute(page: Selectuser, initial: true),
    AdaptiveRoute(page: AuthScreen, initial: true),
    AdaptiveRoute(page: DashboardScreen),
    AdaptiveRoute(page: OrderView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DialogService)
  ],
  logger: StackedLogger(),
)
class App {}
