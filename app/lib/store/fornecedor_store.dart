import 'package:app/model/fornecedor_model.dart';
import 'package:app/service/firebase_realtime_fornecedor.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'fornecedor_store.g.dart';

class FornecedorStore = _FornecedorStore with _$FornecedorStore;

abstract class _FornecedorStore with Store {
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
  FornecedorModel getFornecedorByIdOrNew(String? idFornecedor) {
    if (idFornecedor != null) {
      List<FornecedorModel> fornecedoresModel = fornecedores.toList();
      FornecedorModel model = fornecedoresModel.firstWhere(
          (fornecedor) => fornecedor.nome == idFornecedor);
      return model;
    } else {
      return FornecedorModel(nome: "", origens: []);
    }
  }

  @action
  Future<void> salvarFornecedor(FornecedorModel fornecedor) async {}

  @action
  void addDestinoToOrigem(FornecedorModel fornecedor, String estado, bool isCapital) {

  }

  @action
  void addOrigemToFornecedor(FornecedorModel fornecedor) {

  }

}
