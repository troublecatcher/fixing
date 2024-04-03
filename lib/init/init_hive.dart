import 'package:fixease/features/new_item/expense.dart';
import 'package:fixease/features/new_item/item.dart';
import 'package:fixease/main.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ExpenseAdapter());
  Hive.registerAdapter(ItemAdapter());
  itemBox = await Hive.openBox('items');
}
