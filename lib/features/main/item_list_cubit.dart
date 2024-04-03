import 'package:bloc/bloc.dart';
import 'package:fixease/features/new_item/item.dart';
import 'package:fixease/main.dart';

class ItemListCubit extends Cubit<List<Item>> {
  ItemListCubit() : super([]) {
    read();
  }

  create(Item item) {
    itemBox!.add(item).whenComplete(() => read());
  }

  read() {
    if (itemBox!.isNotEmpty) {
      List<Item> itemList = [];
      for (var i = 0; i < itemBox!.length; i++) {
        final item = itemBox!.getAt(i);
        itemList.add(item!);
      }
      emit(itemList);
    } else {
      emit([]);
    }
  }

  update(int index, Item item) {
    itemBox!.putAt(index, item);
    read();
  }

  delete(int index) {
    itemBox!.deleteAt(index);
    read();
  }
}
