import 'package:bloc_test/data/api/api_service.dart';
import 'package:bloc_test/data/model/item.dart';

class ItemRepository {
  final ApiService apiService;

  const ItemRepository({required this.apiService});

  Future<List<Item>> fetchItems() async {
    try {
      final items = await apiService.fetchItems();
      return items;
    } catch (e) {
      throw Exception("Failed to load items: ${e.toString()}");
    }
  }
}
