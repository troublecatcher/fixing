import 'package:hive_flutter/hive_flutter.dart';

part 'expense.g.dart';

@HiveType(typeId: 0)
class Expense {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final double price;

  Expense(this.name, this.price);
}
