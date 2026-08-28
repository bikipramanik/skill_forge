import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_forge_app/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit() : super(AuthState());

  void toggleIsLogin(){
    emit(state.copyWith(isLogin: !state.isLogin));
  }
}