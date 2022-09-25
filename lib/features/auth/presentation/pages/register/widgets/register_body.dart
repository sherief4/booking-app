import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/widgets/default_button.dart';
import 'package:booking_app/core/widgets/default_input_text_form_field.dart';
import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:booking_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:booking_app/features/auth/presentation/pages/login/login_page.dart';
import 'package:booking_app/features/hotels/presentation/layout/hotels_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          if (state.data.status.type == '1') {
            showSnackBar(
              context: context,
              text: state.data.status.title!,
              textColor: mainColor,
            );
            navigateAndFinish(context: context, route: const HotelsLayout());
          } else {
            showSnackBar(
              context: context,
              text: state.data.status.title!,
              textColor: Colors.red,
            );
          }
        }
      },
      builder: (context, state) {
        final formKey = GlobalKey<FormState>();
        final TextEditingController nameController = TextEditingController();
        final TextEditingController emailController = TextEditingController();
        final TextEditingController passwordController =
            TextEditingController();
        final TextEditingController passwordConfirmController =
            TextEditingController();
        return Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const VerticalSpace(
                    4.0,
                  ),
                  DefaultTextFormField(
                    controller: nameController,
                    title: 'Name',
                    hintText: 'Enter your name',
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Name can\'t be empty';
                      }
                      return null;
                    },
                  ),
                  const VerticalSpace(
                    2.0,
                  ),
                  DefaultTextFormField(
                    controller: emailController,
                    title: 'Your email',
                    hintText: 'Enter your mail',
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Email can\'t be empty';
                      }
                      return null;
                    },
                  ),
                  const VerticalSpace(
                    2.0,
                  ),
                  DefaultTextFormField(
                    controller: passwordController,
                    title: 'Password',
                    hintText: 'Enter password',
                    isPassword: true,
                    validator: (String? value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'Password is too short';
                      }
                      return null;
                    },
                  ),
                  const VerticalSpace(
                    2.0,
                  ),
                  DefaultTextFormField(
                    controller: passwordConfirmController,
                    title: 'Password Confirmation',
                    hintText: 'Re enter password',
                    isPassword: true,
                    validator: (String? value) {
                      if (value!.isEmpty ||
                          value.length < 6 ||
                          passwordController.text !=
                              passwordConfirmController.text) {
                        return 'Password is too short';
                      }
                      return null;
                    },
                  ),
                  const VerticalSpace(
                    4.0,
                  ),
                  DefaultButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                          RegisterEvent(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordConfirmController.text,
                            passwordConfirmation:
                                passwordConfirmController.text,
                          ),
                        );
                      }
                    },
                    color: mainColor,
                    textColor: Colors.white,
                    text: 'Register',
                  ),
                  const VerticalSpace(
                    2.0,
                  ),
                  Center(
                    child: Text(
                      'By signing up, you agree to our terms of \nservices and privacy policy.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? Log in ',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextButton(
                        onPressed: () {
                          navigateTo(
                            context: context,
                            route: const LoginPage(),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
