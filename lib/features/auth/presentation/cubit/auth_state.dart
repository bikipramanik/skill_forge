import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool isLogin;
  const AuthState({this.isLogin = false});

  AuthState copyWith({bool? isLogin}) {
    return AuthState(isLogin: isLogin ?? this.isLogin);
  }

  @override
  List<Object?> get props => [isLogin];
}
