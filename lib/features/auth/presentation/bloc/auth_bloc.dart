import 'package:bloc/bloc.dart';
import 'package:booking_app/core/utils/constants/strings.dart';
import 'package:booking_app/features/auth/domain/entities/data.dart';
import 'package:booking_app/features/auth/domain/usecases/get_profile_info.dart';
import 'package:booking_app/features/auth/domain/usecases/login.dart';
import 'package:booking_app/features/auth/domain/usecases/register.dart';
import 'package:booking_app/features/auth/domain/usecases/update_profile.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final GetProfileInfoUseCase getProfileInfoUseCase;

  AuthBloc({
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
          emit(AuthSuccessState(data: r));
        });
      }
      if (event is GetProfileEvent) {
        final failureOrData = await getProfileInfoUseCase();
        failureOrData.fold((l) {
          emit(GetProfileErrorState(error: mapFailureToString(l)));
        }, (r) {
          emit(GetProfileSuccessState(data: r));
        });
      }
    });
  }
}
