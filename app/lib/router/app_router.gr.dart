// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../views/about_view.dart' as _i3;
import '../views/cadastro_fornecedor_view.dart' as _i8;
import '../views/configuracao_fornecedor_view.dart' as _i6;
import '../views/configuracao_usuario_view.dart' as _i5;
import '../views/historico_view.dart' as _i7;
import '../views/home_view.dart' as _i2;
import '../views/login_view.dart' as _i1;
import '../views/map_view.dart' as _i4;
import '../views/registro_fornecedor_view.dart' as _i9;
import 'admin_guard.dart' as _i13;
import 'auth_guard.dart' as _i12;

class AppRouter extends _i10.RootStackRouter {
  AppRouter(
      {_i11.GlobalKey<_i11.NavigatorState>? navigatorKey,
      required this.authGuard,
      required this.adminGuard})
      : super(navigatorKey);

  final _i12.AuthGuard authGuard;

  final _i13.AdminGuard adminGuard;

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginView());
    },
    HomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeView());
    },
    AboutRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.AboutView());
    },
    MapRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.MapView());
    },
    ConfiguracaoUsuarioRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ConfiguracaoUsuarioView());
    },
    ConfiguracaoFornecedorRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ConfiguracaoFornecedorView());
    },
    HistoricoRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.HistoricoView());
    },
    CadastroFornecedorRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.CadastroFornecedorView());
    },
    RegistroFornecedorRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<RegistroFornecedorRouteArgs>(
          orElse: () => RegistroFornecedorRouteArgs(
              idFornecedor: queryParams.optString('id_fornecedor')));
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.RegistroFornecedorView(
              key: args.key, idFornecedor: args.idFornecedor));
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        _i10.RouteConfig(LoginRoute.name, path: '/login'),
        _i10.RouteConfig(HomeRoute.name, path: '/home', guards: [authGuard]),
        _i10.RouteConfig(AboutRoute.name, path: '/about'),
        _i10.RouteConfig(MapRoute.name, path: '/map', guards: [authGuard]),
        _i10.RouteConfig(ConfiguracaoUsuarioRoute.name,
            path: '/configuracao-usuario', guards: [authGuard, adminGuard]),
        _i10.RouteConfig(ConfiguracaoFornecedorRoute.name,
            path: '/configuracao-fornecedor', guards: [authGuard, adminGuard]),
        _i10.RouteConfig(HistoricoRoute.name,
            path: '/historico', guards: [authGuard]),
        _i10.RouteConfig(CadastroFornecedorRoute.name,
            path: '/cadastro-fornecedor', guards: [authGuard, adminGuard]),
        _i10.RouteConfig(RegistroFornecedorRoute.name,
            path: '/registro-fornecedor', guards: [authGuard, adminGuard])
      ];
}

/// generated route for
/// [_i1.LoginView]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.AboutView]
class AboutRoute extends _i10.PageRouteInfo<void> {
  const AboutRoute() : super(AboutRoute.name, path: '/about');

  static const String name = 'AboutRoute';
}

/// generated route for
/// [_i4.MapView]
class MapRoute extends _i10.PageRouteInfo<void> {
  const MapRoute() : super(MapRoute.name, path: '/map');

  static const String name = 'MapRoute';
}

/// generated route for
/// [_i5.ConfiguracaoUsuarioView]
class ConfiguracaoUsuarioRoute extends _i10.PageRouteInfo<void> {
  const ConfiguracaoUsuarioRoute()
      : super(ConfiguracaoUsuarioRoute.name, path: '/configuracao-usuario');

  static const String name = 'ConfiguracaoUsuarioRoute';
}

/// generated route for
/// [_i6.ConfiguracaoFornecedorView]
class ConfiguracaoFornecedorRoute extends _i10.PageRouteInfo<void> {
  const ConfiguracaoFornecedorRoute()
      : super(ConfiguracaoFornecedorRoute.name,
            path: '/configuracao-fornecedor');

  static const String name = 'ConfiguracaoFornecedorRoute';
}

/// generated route for
/// [_i7.HistoricoView]
class HistoricoRoute extends _i10.PageRouteInfo<void> {
  const HistoricoRoute() : super(HistoricoRoute.name, path: '/historico');

  static const String name = 'HistoricoRoute';
}

/// generated route for
/// [_i8.CadastroFornecedorView]
class CadastroFornecedorRoute extends _i10.PageRouteInfo<void> {
  const CadastroFornecedorRoute()
      : super(CadastroFornecedorRoute.name, path: '/cadastro-fornecedor');

  static const String name = 'CadastroFornecedorRoute';
}

/// generated route for
/// [_i9.RegistroFornecedorView]
class RegistroFornecedorRoute
    extends _i10.PageRouteInfo<RegistroFornecedorRouteArgs> {
  RegistroFornecedorRoute({_i11.Key? key, String? idFornecedor})
      : super(RegistroFornecedorRoute.name,
            path: '/registro-fornecedor',
            args: RegistroFornecedorRouteArgs(
                key: key, idFornecedor: idFornecedor),
            rawQueryParams: {'id_fornecedor': idFornecedor});

  static const String name = 'RegistroFornecedorRoute';
}

class RegistroFornecedorRouteArgs {
  const RegistroFornecedorRouteArgs({this.key, this.idFornecedor});

  final _i11.Key? key;

  final String? idFornecedor;

  @override
  String toString() {
    return 'RegistroFornecedorRouteArgs{key: $key, idFornecedor: $idFornecedor}';
  }
}
