import 'package:formvalidation_app/src/core/base/usecase_base.dart';
import 'package:formvalidation_app/src/features/domain/repositories/product_repository.dart';
import 'package:formvalidation_app/src/features/domain/usecases/params.dart';

class UpdateProductUseCase extends UseCaseBase<bool, Params> {
  ProductRepository repository;

  UpdateProductUseCase({this.repository});

  @override
  Future<bool> call(Params params) async {
    return await repository.updateProduct(params.product);
  }
}
