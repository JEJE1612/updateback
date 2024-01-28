// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

abstract class LoginState {}

class InitalState extends LoginState {}

class ChangeIconSuffix extends LoginState {}

class LodingLoginState extends LoginState {}

class ScafullLoginState extends LoginState {
  final String uid;
  ScafullLoginState({
    required this.uid,
  });
}

class ErrorLoginState extends LoginState {}

class Forgetpasswordstate extends LoginState {}
