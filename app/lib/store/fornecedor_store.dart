import 'package:app/model/fornecedor_model.dart';
import 'package:app/model/regiao_frete_model.dart';
import 'package:app/service/firebase_realtime_fornecedor.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'fornecedor_store.g.dart';

class FornecedorStore = _FornecedorStore with _$FornecedorStore;

abstract class _FornecedorStore with Store {
  @observable
  FornecedorModel currentFornecedor = FornecedorModel(nome: "", origens: []);

  @observable
  ObservableList<FornecedorModel> fornecedores =
      ObservableList<FornecedorModel>();

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
  void editDestino(FornecedorOrigem origem, RegiaoFreteModel destino) {
    // TODO validar o destino
    // nao interromper a edicao

    // TODO validar destinos
    // interrompe a edicao

    // FornecedorModel old = currentFornecedor;
    // old.origens.firstWhere((element) => false).removeWhere(
    //     (d) => d.capital == destino.capital && d.estado == destino.estado);
    
    
    //old.origens.add(destino);
  }

  @action
  void editOrigemCapital(FornecedorOrigem origem, bool value) {

  }

  @action
  void editOrigemEstado(FornecedorOrigem origem, String value) {

  }

  @action
  Future<void> salvarFornecedor() async {
    FirebaseRealtimeFornecedor fornecedorService =
        GetIt.I.get<FirebaseRealtimeFornecedor>();

    //TODO validar dados no modelo do fornecedor

    await fornecedorService.salvarFornecedor(currentFornecedor);
  }

  @action
  void addDestinoToOrigem(String estado, bool isCapital) {
    try {
      FornecedorModel old = currentFornecedor;
      currentFornecedor = FornecedorModel(nome: "", origens: []);
      FornecedorOrigem origem = old.origens
          .firstWhere((o) => o.estado == estado && o.capital == isCapital);
      origem.destinos.add(RegiaoFreteModel(
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
}
