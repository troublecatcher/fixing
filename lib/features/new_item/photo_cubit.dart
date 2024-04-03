import 'dart:typed_data';

import 'package:bloc/bloc.dart';

class PhotoCubit extends Cubit<List<Uint8List>> {
  PhotoCubit() : super([]);
  add(Uint8List photo) => emit([...state, photo]);
  remove(int index) => emit([...state]..removeAt(index));
}
