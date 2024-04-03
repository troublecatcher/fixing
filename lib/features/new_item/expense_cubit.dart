import 'package:bloc/bloc.dart';
import 'package:fixease/features/new_item/expense.dart';

class ExpenseCubit extends Cubit<List<Expense>> {
  ExpenseCubit() : super([]);
  add(Expense expense) => emit([...state, expense]);
  remove(int index) => emit([...state]..removeAt(index));
}
