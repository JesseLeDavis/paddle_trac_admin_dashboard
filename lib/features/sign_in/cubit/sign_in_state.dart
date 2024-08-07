part of 'sign_in_cubit.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial({
    @Default('') String email,
    @Default('') String password,
  }) = _Initial;
}
