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
    AutoRoute(path: "/login", page: LoginView),
    AutoRoute(path: "/home", page: HomeView, initial: true),
    AutoRoute(path: "/about", page: AboutView),
    AutoRoute(path: "/map", page: MapView),
    AutoRoute(path: "/configuracao-usuario", page: ConfiguracaoUsuarioView),
    AutoRoute(path: "/configuracao-fornecedor", page: ConfiguracaoFornecedorView),
    AutoRoute(path: "/fornecedores", page: FornecedoresView),
    AutoRoute(path: "/historico", page: HistoricoView),
    AutoRoute(path: "/cadastro-fornecedor", page: CadastroFornecedorView)
  ],        
)        
class $AppRouter {}
