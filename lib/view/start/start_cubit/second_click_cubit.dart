import 'package:flutter_bloc/flutter_bloc.dart';

class SecondClickCubit extends Cubit<int> {
  SecondClickCubit() : super(0); // Use -1 to indicate no selection initially

  void tapIndex(int index) => emit(index);
}
