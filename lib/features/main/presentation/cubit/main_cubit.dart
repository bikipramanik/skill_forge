import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_forge_app/features/main/presentation/cubit/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  void setSelectedIndex(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
