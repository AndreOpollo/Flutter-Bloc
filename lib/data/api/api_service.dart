import 'package:bloc_test/data/model/item.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com",
      connectTimeout: Duration(seconds: 100),
      receiveTimeout: Duration(seconds: 100)));

  Future<List<Item>> fetchItems() async {
    try {
      final response = await _dio.get('/todos');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => Item.fromJson(json))
            .toList();
      }
      throw Exception("Failed to Load Users");
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }
}
