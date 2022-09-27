import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/widgets/default_button.dart';
import 'package:booking_app/core/widgets/default_input_text_form_field.dart';
import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:booking_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmNewPasswordController =
        TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccessState) {
          showSnackBar(
            context: context,
            text: 'Password changed successfully!',
            textColor: mainColor,
          );
          Navigator.of(context).pop();
        }
        if (state is ChangePasswordErrorState) {
          showSnackBar(
            context: context,
            text: state.error,
            textColor: Colors.red,
          );
        }
      },
      builder: (context, state) {
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
                children: [
                  Text(
                    'Change Password',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if (state is ChangePasswordLoadingState)
                    const VerticalSpace(
                      1.0,
                    ),
                  if (state is ChangePasswordLoadingState) const LinearProgressIndicator(),
                  const VerticalSpace(
                    2.0,
                  ),
                  Text(
                    'Enter your email, then add the new password and confirm it',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const VerticalSpace(
                    2.0,
                  ),
                  DefaultTextFormField(
                    title: 'Email',
                    isPassword: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Email Can\'t be empty';
                      }
                      return null;
                    },
                    hintText: 'Enter email',
                    controller: emailController,
                  ),
                  const VerticalSpace(
                    2.0,
                  ),
                  DefaultTextFormField(
                    title: 'New Password',
                    isPassword: true,
                    hintText: 'Enter new password',
                    validator: (String? value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'Password is too short';
                      }
                      return null;
                    },
                    controller: newPasswordController,
                  ),
                  const VerticalSpace(
                    2.0,
                  ),
                  DefaultTextFormField(
                    title: 'Confirm Password',
                    hintText: 'Confirm new password',
                    validator: (String? value) {
                      if (value != newPasswordController.text) {
                        return 'Password miss match';
                      }
                      return null;
                    },
                    isPassword: true,
                    controller: confirmNewPasswordController,
                  ),
                  const VerticalSpace(
                    4.0,
                  ),
                  DefaultButton(
                    onPressed: () {

                      if (formKey.currentState!.validate()) {
                        AuthBloc.get(context).add(
                          ChangePasswordEvent(
                            token: AuthBloc.get(context).data!.user!.token!,
                            email: emailController.text,
                            newPassword: newPasswordController.text,
                            newPasswordConfirm:
                                confirmNewPasswordController.text,
                          ),
                        );
                      }
                    },
                    color: mainColor,
                    textColor: Colors.white,
                    text: 'Apply',
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
