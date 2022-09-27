import 'dart:io';

import 'package:booking_app/core/utils/constants/strings.dart';
import 'package:booking_app/features/auth/domain/entities/data.dart';
import 'package:booking_app/features/auth/domain/usecases/change_password.dart';
import 'package:booking_app/features/auth/domain/usecases/get_profile_info.dart';
import 'package:booking_app/features/auth/domain/usecases/login.dart';
import 'package:booking_app/features/auth/domain/usecases/register.dart';
import 'package:booking_app/features/auth/domain/usecases/update_profile.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final GetProfileInfoUseCase getProfileInfoUseCase;
  final ChangePasswordUseCase changePasswordUseCase;

  static AuthBloc get(context) => BlocProvider.of<AuthBloc>(context);
  Data? data;
  File? profileImage;
  var picker = ImagePicker();

  AuthBloc({
    required this.changePasswordUseCase,
    required this.loginUseCase,
    required this.registerUseCase,
    required this.updateProfileUseCase,
    required this.getProfileInfoUseCase,
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(AuthLoadingState());
        final failureOrData = await loginUseCase(
          email: event.email,
          password: event.password,
        );
        failureOrData.fold(
            (failure) => {
                  emit(AuthErrorState(error: mapFailureToString(failure)))
                }, (r) {
          data = r;
          emit(AuthSuccessState(data: r));
        });
      }
      if (event is RegisterEvent) {
        emit(AuthLoadingState());
        final failureOrData = await registerUseCase(
          email: event.email,
          name: event.name,
          password: event.password,
          passwordConfirm: event.passwordConfirmation,
        );
        failureOrData.fold((l) {
          emit(AuthErrorState(error: mapFailureToString(l)));
        }, (r) {
          data = r;
          emit(AuthSuccessState(data: r));
        });
      }
      if (event is GetProfileEvent) {
        final failureOrData = await getProfileInfoUseCase();
        failureOrData.fold((l) {
          emit(GetProfileErrorState(error: mapFailureToString(l)));
        }, (r) {
          data = r;
          emit(GetProfileSuccessState(data: r));
        });
      }
      if (event is ChooseProfileImageEvent) {
        emit(ChooseImageSuccessState(image: event.image));
      }
      if (event is UpdateProfileEvent) {
        final failureOrData = await updateProfileUseCase(
          name: event.name,
          email: event.email,
          image: event.image,
          token: event.token,
        );
        failureOrData.fold((l) {
          emit(UpdateProfileErrorState(error: mapFailureToString(l)));
        }, (r) {
          data = r;
          emit(UpdateProfileSuccessState(data: r));
        });
      }
      if (event is ChangePasswordEvent) {
        emit(ChangePasswordLoadingState());
        final failureOrData = await changePasswordUseCase(
          token: event.token,
          email: event.email,
          password: event.newPassword,
          passwordConfirm: event.newPasswordConfirm,
        );
        failureOrData.fold((l) {
          emit(ChangePasswordErrorState(error: mapFailureToString(l)));
        }, (r) {
          emit(ChangePasswordSuccessState());
        });
      }
    });
  }
}
