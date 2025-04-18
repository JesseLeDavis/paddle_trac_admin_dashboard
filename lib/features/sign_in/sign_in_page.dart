import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paddle_trac_admin_dashboard/app/view/app.dart';
import 'package:paddle_trac_admin_dashboard/constants/sizes.dart';
import 'package:paddle_trac_admin_dashboard/features/sign_in/cubit/sign_in_cubit.dart';
import 'package:paddle_trac_admin_dashboard/gen/assets.gen.dart';
import 'package:paddle_trac_admin_dashboard/infrastructure/injection/injection.dart';
import 'package:paddle_trac_admin_dashboard/shared/themes/color_themes.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInCubit>(),
      child: const SignInVIew(),
    );
  }
}

class SignInVIew extends StatefulWidget {
  const SignInVIew({
    super.key,
  });

  @override
  State<SignInVIew> createState() => _SignInVIewState();
}

class _SignInVIewState extends State<SignInVIew> {
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(25),
          width: 500,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(8, 8),
                color: ColorThemes.lightGrey.darken(),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ignore: deprecated_member_use_from_same_package
              Assets.icons.paddleLogo.svg(color: ColorThemes.courtGreen),
              gapH4,
              Text(
                'Admin Dashboard',
                style: context.callout.copyWith(color: ColorThemes.primary),
              ),
              gapH32,
              TextFormField(
                onChanged: (email) {
                  context.read<SignInCubit>().updateEmail(email: email);
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              gapH12,
              TextFormField(
                onChanged: (password) {
                  context
                      .read<SignInCubit>()
                      .updatePassword(password: password);
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                ),
                obscureText: passwordVisible,
                keyboardType: TextInputType.visiblePassword,
              ),
              gapH24,
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: ColorThemes.courtGreen,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    context.read<SignInCubit>().signIn(context);
                  },
                  child: const Text('Log In'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
