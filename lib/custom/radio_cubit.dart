import 'package:bloc/bloc.dart';

class RadioCubit extends Cubit<int> {
  RadioCubit() : super(-1);
  set(int value) => emit(value);
}
