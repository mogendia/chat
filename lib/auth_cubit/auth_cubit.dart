import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  void loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      UserCredential user =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        emit(LoginError(errorMessage: 'weak-password'));
      } else if (error.code == 'email-already-in-use') {
        emit(
          LoginError(errorMessage: 'email-already-in-use'),
        );
      }
    } catch (error) {
      emit(LoginError(errorMessage: 'something went wrong'));
    }
  }

  void registerUser({
    required String email,
    required String password,
  }) async {
    UserCredential user =
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
