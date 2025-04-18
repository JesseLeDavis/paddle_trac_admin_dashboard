import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:paddle_trac_admin_dashboard/routes/paths/paths.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState.initial());

  void updateEmail({required String email}) {
    emit(state.copyWith(email: email));
  }

  void updatePassword({required String password}) {
    emit(state.copyWith(password: password));
  }

  Future<void> signIn(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      if (credential.user != null) {
        // ignore: use_build_context_synchronously
        context.goNamed(dashboardPath);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
    }
  }
}
