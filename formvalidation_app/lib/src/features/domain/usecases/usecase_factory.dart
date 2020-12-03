import 'package:formvalidation_app/src/features/domain/repositories/repository_factory.dart';
import 'package:formvalidation_app/src/features/domain/usecases/create_product_usecase.dart';
import 'package:formvalidation_app/src/features/domain/usecases/delet_product_usecase.dart';
import 'package:formvalidation_app/src/features/domain/usecases/get_all_products_usecase.dart';
import 'package:formvalidation_app/src/features/domain/usecases/update_product_usecase.dart';
import 'package:formvalidation_app/src/features/domain/usecases/upload_image_usecase.dart';

class UseCaseFactory {
  static final UseCaseFactory _singleton = new UseCaseFactory();

  static UseCaseFactory getFactory() {
    return _singleton;
  }

  final RepositoryFactory _factory = RepositoryFactory.getFactory();

  CreateProductUseCase _createProductUseCase;
  GetAllProductsUseCase _getAllProductsUseCase;
  DeleteProductUseCase _deleteProductUseCase;
  UpdateProductUseCase _updateProductUseCase;
  UploadImageUseCase _uploadImageUseCase;

  CreateProductUseCase get createProductUseCase {
    if (_createProductUseCase == null) {
      _createProductUseCase =
          new CreateProductUseCase(repository: _factory.getProductRepository);
    }
    return _createProductUseCase;
  }

  GetAllProductsUseCase get getAllProductsUseCase {
    if (_getAllProductsUseCase == null) {
      _getAllProductsUseCase =
          new GetAllProductsUseCase(repository: _factory.getProductRepository);
    }
    return _getAllProductsUseCase;
  }

  DeleteProductUseCase get deleteProductUseCase {
    if (_deleteProductUseCase == null) {
      _deleteProductUseCase =
          new DeleteProductUseCase(repository: _factory.getProductRepository);
    }
    return _deleteProductUseCase;
  }

  UpdateProductUseCase get updateProductUseCase {
    if (_updateProductUseCase == null) {
      _updateProductUseCase =
          new UpdateProductUseCase(repository: _factory.getProductRepository);
    }
    return _updateProductUseCase;
  }

  UploadImageUseCase get uploadImageUseCase {
    if (_uploadImageUseCase == null) {
      _uploadImageUseCase =
          new UploadImageUseCase(repository: _factory.getImageRepository);
    }
    return _uploadImageUseCase;
  }
}
