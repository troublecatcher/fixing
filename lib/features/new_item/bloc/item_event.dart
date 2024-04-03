part of 'item_bloc.dart';

@immutable
sealed class ItemEvent {}

final class ItemFirstEvent extends ItemEvent {
  final String name;
  final String category;
  final String reason;
  final String breakingRate;

  ItemFirstEvent(this.name, this.category, this.reason, this.breakingRate);
}

final class ItemSecondEvent extends ItemEvent {
  final List<Expense> expenses;

  ItemSecondEvent(this.expenses);
}

final class ItemFlushEvent extends ItemEvent {}

final class ItemRestoreEvent extends ItemEvent {
  final Item item;

  ItemRestoreEvent(this.item);
}
