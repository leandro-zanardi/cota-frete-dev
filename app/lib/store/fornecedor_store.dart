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
}