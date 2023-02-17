abstract class AuthStates{}

class AuthInitial extends AuthStates{}
class RegisterLoading extends AuthStates{}
class RegisterSuccess extends AuthStates{}
class RegisterError extends AuthStates{
  String errorMessage;
  RegisterError({required this.errorMessage});
}
class LoginLoading extends AuthStates{}
class LoginSuccess extends AuthStates{}
class LoginError extends AuthStates{
  String errorMessage;
  LoginError({required this.errorMessage});
}