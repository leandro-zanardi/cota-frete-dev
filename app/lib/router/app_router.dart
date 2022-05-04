import 'package:app/router/admin_guard.dart';
import 'package:app/router/auth_guard.dart';
import 'package:app/views/about_view.dart';
import 'package:app/views/cadastro_fornecedor_view.dart';
import 'package:app/views/configuracao_fornecedor_view.dart';
import 'package:app/views/configuracao_usuario_view.dart';
import 'package:app/views/fornecedores_view.dart';
import 'package:app/views/historico_view.dart';
import 'package:app/views/home_view.dart';
import 'package:app/views/login_view.dart';
import 'package:app/views/map_view.dart';
import 'package:auto_route/annotations.dart';

@MaterialAutoRouter(        
  replaceInRouteName: 'View,Route',        
  routes: <AutoRoute>[        
    AutoRoute(path: "/login", initial: true, page: LoginView),
    AutoRoute(path: "/home", page: HomeView, guards: [AuthGuard]),
    AutoRoute(path: "/about", page: AboutView),
    AutoRoute(path: "/map", page: MapView, guards: [AuthGuard]),
    AutoRoute(path: "/configuracao-usuario", page: ConfiguracaoUsuarioView, guards: [AuthGuard]),
    AutoRoute(path: "/configuracao-fornecedor", page: ConfiguracaoFornecedorView, guards: [AuthGuard, AdminGuard]),
    AutoRoute(path: "/fornecedores", page: FornecedoresView, guards: [AuthGuard]),
    AutoRoute(path: "/historico", page: HistoricoView, guards: [AuthGuard]),
    AutoRoute(path: "/cadastro-fornecedor", page: CadastroFornecedorView, guards: [AuthGuard, AdminGuard])
  ],        
)        
class $AppRouter {}
