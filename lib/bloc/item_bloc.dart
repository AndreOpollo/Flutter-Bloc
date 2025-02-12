import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc/item_events.dart';
import 'package:bloc_test/bloc/item_state.dart';
import 'package:bloc_test/data/repository/item_repository.dart';

class ItemBloc extends Bloc<ItemEvents, ItemState> {
  final ItemRepository itemRepository;

  ItemBloc(this.itemRepository) : super(ItemInitial()) {
    on<FetchItems>((event, emit) async {
      emit(ItemLoading());
      try {
        final items = await itemRepository.fetchItems();
        emit(ItemLoaded(items));
      } catch (e) {
        emit(ItemError(e.toString()));
      }
    });
  }
}
