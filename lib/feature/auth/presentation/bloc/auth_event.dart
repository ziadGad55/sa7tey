import 'package:sa7ty/core/constant/enum.dart';

class AuthEvent {}

class loginEvent extends AuthEvent {
  final String emailAddress;
  final String password;
  final usertype selectedtype;

  loginEvent(this.emailAddress, this.password, this.selectedtype);
}

class registerEvent extends AuthEvent {

  final String name;
  final String emailAddress;
  final String password;
  final usertype selectedtype;

  registerEvent(this.name, this.emailAddress, this.password, this.selectedtype);
}