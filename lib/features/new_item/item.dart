import 'package:hive_flutter/hive_flutter.dart';
import 'dart:typed_data';

import 'package:fixease/features/new_item/expense.dart';

part 'item.g.dart';

@HiveType(typeId: 1)
class Item extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String category;

  @HiveField(2)
  final String reason;

  @HiveField(3)
  final String breakingRate;

  @HiveField(4)
  final List<Expense> expenses;

  @HiveField(5)
  final List<Uint8List> photos;

  @HiveField(6)
  final String desc;

  @HiveField(7)
  final bool repaired;

  Item(
    this.name,
    this.category,
    this.reason,
    this.breakingRate,
    this.expenses,
    this.photos,
    this.desc,
    this.repaired,
  );

  Item.empty()
      : name = '',
        category = '',
        reason = '',
        breakingRate = '',
        expenses = [],
        photos = [],
        desc = '',
        repaired = false;

  Item copyWith(
      {String? name,
      String? category,
      String? reason,
      String? breakingRate,
      List<Expense>? expenses,
      List<Uint8List>? photos,
      String? desc,
      bool? repaired}) {
    return Item(
      name ?? this.name,
      category ?? this.category,
      reason ?? this.reason,
      breakingRate ?? this.breakingRate,
      expenses ?? this.expenses,
      photos ?? this.photos,
      desc ?? this.desc,
      repaired ?? this.repaired,
    );
  }
}
