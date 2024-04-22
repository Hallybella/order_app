// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:order_app/core/models/user_model.dart' as _i6;
import 'package:order_app/modules/user/auth/sign_in_view.dart' as _i2;
import 'package:order_app/modules/user/dashboard/dashboard_view.dart' as _i3;
import 'package:order_app/modules/user/order/order_view.dart' as _i4;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i7;

class Routes {
  static const authScreen = '/';

  static const dashboardScreen = '/dashboard-screen';

  static const orderView = '/order-view';

  static const all = <String>{
    authScreen,
    dashboardScreen,
    orderView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.authScreen,
      page: _i2.AuthScreen,
    ),
    _i1.RouteDef(
      Routes.dashboardScreen,
      page: _i3.DashboardScreen,
    ),
    _i1.RouteDef(
      Routes.orderView,
      page: _i4.OrderView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.AuthScreen: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i2.AuthScreen(),
        settings: data,
      );
    },
    _i3.DashboardScreen: (data) {
      final args = data.getArgs<DashboardScreenArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i3.DashboardScreen(key: args.key, user: args.user),
        settings: data,
      );
    },
    _i4.OrderView: (data) {
      final args = data.getArgs<OrderViewArguments>(
        orElse: () => const OrderViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i4.OrderView(key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class DashboardScreenArguments {
  const DashboardScreenArguments({
    this.key,
    required this.user,
  });

  final _i5.Key? key;

  final _i6.AppUser? user;

  @override
  String toString() {
    return '{"key": "$key", "user": "$user"}';
  }

  @override
  bool operator ==(covariant DashboardScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.user == user;
  }

  @override
  int get hashCode {
    return key.hashCode ^ user.hashCode;
  }
}

class OrderViewArguments {
  const OrderViewArguments({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant OrderViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i7.NavigationService {
  Future<dynamic> navigateToAuthScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.authScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardScreen({
    _i5.Key? key,
    required _i6.AppUser? user,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.dashboardScreen,
        arguments: DashboardScreenArguments(key: key, user: user),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrderView({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.orderView,
        arguments: OrderViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAuthScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.authScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardScreen({
    _i5.Key? key,
    required _i6.AppUser? user,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.dashboardScreen,
        arguments: DashboardScreenArguments(key: key, user: user),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOrderView({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.orderView,
        arguments: OrderViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
