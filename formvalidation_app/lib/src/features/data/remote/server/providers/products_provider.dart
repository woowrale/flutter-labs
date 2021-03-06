import 'dart:convert';
import 'package:formvalidation_app/src/core/settings/user_settings.dart';
import 'package:http/http.dart' as http;
import 'package:formvalidation_app/src/core/utils/load_properties.dart';
import 'package:formvalidation_app/src/features/data/remote/models/product_model.dart';
import 'package:formvalidation_app/src/features/data/remote/server/api/api_products_provider.dart';


class ProductProvider implements ApiProductsProvider {

  final _settings = UserSettings();

  @override
  Future<bool> create(ProductModel productModel) async {
    final response = await http.post(await _getUrl('products'),
        body: productModelToJson(productModel));

    final decodeData = json.decode(response.body);
  }

  @override
  Future<List<ProductModel>> getAll() async {
    final response = await http.get(await _getUrl('products'));

    final Map<String, dynamic> decodeData = json.decode(response.body);
    if (decodeData == null) return [];

    final List<ProductModel> products = List();
    decodeData.forEach((id, prod) {
      final product = ProductModel.fromJson(prod);
      product.id = id;
      products.add(product);
    });

    return products;
  }

  @override
  Future<bool> delete(ProductModel productModel) async {
    final response =
        await http.delete(await _getUrl('products/${productModel.id}'));
    final decodeData = json.decode(response.body);
  }

  Future<String> _getUrl(String urlComplement) async {
    final _urlBase = await properties.loadDataByKey('urlBase');
    //final String url = '$_urlBase/$urlComplement.json?auth=${_settings.token}';
    final String url = '$_urlBase/$urlComplement.json';

    return url;
  }

  @override
  Future<bool> update(ProductModel productModel) async {
    final response = await http.put(
        await _getUrl('products/${productModel.id}'),
        body: productModelToJson(productModel));

    final decodeData = json.decode(response.body);
  }

}
