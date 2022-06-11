import 'package:app/model/capital_model.dart';
import 'package:app/model/fornecedor_model.dart';
import 'package:app/service/firebase_realtime_capitais.dart';
import 'package:app/service/firebase_realtime_fornecedor.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'fornecedor_store.g.dart';

class FornecedorStore = _FornecedorStore with _$FornecedorStore;

abstract class _FornecedorStore with Store {
  _FornecedorStore() {
    init();
  }

  @observable
  FornecedorModel currentFornecedor = FornecedorModel(nome: "", origens: []);

  @observable
  String? currentFornecedorError;

  @observable
  ObservableList<FornecedorModel> fornecedores =
      ObservableList<FornecedorModel>();

  @observable
  ObservableList<CapitalModel> capitais = ObservableList<CapitalModel>();

  @action
  init() async {
    FirebaseRealtimeCapitais capitaisService =
        GetIt.I.get<FirebaseRealtimeCapitais>();
    try {
      capitais = ObservableList<CapitalModel>();
      List<CapitalModel> capitaisList = await capitaisService.getCapitais();
      capitais.addAll(capitaisList);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> getFornecedores() async {
    fornecedores.clear();

    FirebaseRealtimeFornecedor fornecedorService =
        GetIt.I.get<FirebaseRealtimeFornecedor>();
    List<FornecedorModel> fornecedoresModel =
        await fornecedorService.getFornecedores();

    fornecedores.addAll(fornecedoresModel);
  }

  @action
  void setCurrentFornecedor(String? idFornecedor) {
    currentFornecedor = getFornecedorByIdOrNew(idFornecedor);
  }

  @action
  FornecedorModel getFornecedorByIdOrNew(String? idFornecedor) {
    if (idFornecedor != null) {
      List<FornecedorModel> fornecedoresModel = fornecedores.toList();
      try {
        FornecedorModel model = fornecedoresModel
            .firstWhere((fornecedor) => fornecedor.nome == idFornecedor);
        return model;
      } catch (e) {
        return FornecedorModel(nome: "", origens: []);
      }
    } else {
      return FornecedorModel(nome: "", origens: []);
    }
  }

  @action
  void editDestino(FornecedorOrigem origem, FornecedorDestino destino) {
    FornecedorModel old = currentFornecedor;

    if (destino.ehValido) {
      if (origem.ehValidoDestino(destino)) {
        //save
      }
    }

    currentFornecedor = FornecedorModel(nome: "", origens: []);
    currentFornecedor = old;
  }

  @action
  void editOrigemCapital(FornecedorOrigem origem, bool value) {}

  @action
  void editOrigemEstado(FornecedorOrigem origem, String value) {}

  @action
  Future<void> salvarFornecedor() async {
    try {
      FirebaseRealtimeFornecedor fornecedorService =
          GetIt.I.get<FirebaseRealtimeFornecedor>();
      if (currentFornecedor.ehValido) {
        await fornecedorService.salvarFornecedor(currentFornecedor);
        currentFornecedorError = null;
      } else {
        currentFornecedorError = "Erro de formatação no fornecedor";
      }
    } catch (e) {
      print(e);
      currentFornecedorError = "erro ao salvar fornecedor";
    }
  }

  @action
  void addDestinoToOrigem(String estado, bool isCapital) {
    try {
      FornecedorModel old = currentFornecedor;
      currentFornecedor = FornecedorModel(nome: "", origens: []);
      FornecedorOrigem origem = old.origens
          .firstWhere((o) => o.estado == estado && o.capital == isCapital);
      origem.destinos.add(FornecedorDestino(
          estado: "", capital: false, precoKm: 0, precoMin: 0));
      currentFornecedor = old;
    } catch (e) {
      print("origem nao encontrada");
    }
  }

  @action
  void addOrigemToFornecedor() {
    try {
      FornecedorModel old = currentFornecedor;
      currentFornecedor = FornecedorModel(nome: "", origens: []);
      FornecedorOrigem origem =
          FornecedorOrigem(capital: false, estado: "", destinos: []);
      old.origens.add(origem);
      currentFornecedor = old;
    } catch (e) {
      print(e);
    }
  }

  @action
  clearCurrentFornecedorError() {
    currentFornecedorError = null;
  }
}
