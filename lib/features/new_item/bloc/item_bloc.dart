import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:fixease/features/new_item/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:fixease/features/new_item/item.dart';

part 'item_event.dart';

class ItemBloc extends Bloc<ItemEvent, Item> {
  ItemBloc() : super(Item.empty()) {
    on<ItemFirstEvent>((event, emit) => emit(state.copyWith(
          name: event.name,
          category: event.category,
          reason: event.reason,
          breakingRate: event.breakingRate,
        )));
    on<ItemSecondEvent>((event, emit) => emit(state.copyWith(
          expenses: event.expenses,
        )));
    on<ItemFlushEvent>((event, emit) => emit(Item.empty()));
    on<ItemRestoreEvent>((event, emit) => emit(event.item));
  }
}
