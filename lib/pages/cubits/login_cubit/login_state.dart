part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLodaing extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFailure extends LoginState {
  String errMassage;
  LoginFailure({required this.errMassage});
}
