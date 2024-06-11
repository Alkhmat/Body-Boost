import 'package:flutter_bloc/flutter_bloc.dart';

class StartClickCubit extends Cubit<int> {
  StartClickCubit() : super(0);
  void tapIndex(int index) => emit(index);
}
