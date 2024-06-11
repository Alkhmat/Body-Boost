import 'package:flutter_bloc/flutter_bloc.dart';

class SecondClickCubit extends Cubit<int> {
  SecondClickCubit() : super(-1);

  void selectItem(int index) {
    emit(index);
  }
}
