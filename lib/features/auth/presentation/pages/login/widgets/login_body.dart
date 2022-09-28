import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/utils/constants/constants.dart';
import 'package:booking_app/core/widgets/default_button.dart';
import 'package:booking_app/core/widgets/default_input_text_form_field.dart';
import 'package:booking_app/core/widgets/vertical_space.dart';
import 'package:booking_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:booking_app/features/hotels/presentation/layouts/hotels_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey < FormState>formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
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

        return Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                if (state is AuthLoadingState)
                  const VerticalSpace(
                    1.0,
                  ),
                if (state is AuthLoadingState) const LinearProgressIndicator(),
                const VerticalSpace(
                  4.0,
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
                  4.0,
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
                  4.0,
                ),
                DefaultButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(
                        LoginEvent(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    }
                  },
                  color: mainColor,
                  textColor: Colors.white,
                  text: 'Login',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
