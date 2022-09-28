import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:booking_app/features/hotels/presentation/bloc/hotels_bloc.dart';
import 'package:booking_app/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/injection/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<AuthBloc>()
            ..add(
              const GetProfileEvent(),
            ),
        ),
        BlocProvider(
          create: (_) => di.sl<HotelsBloc>()
            ..add(
              const GetHotelsEvent(),
            ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Booking App',
        theme: lightTheme,
        home: const SplashPage(),
      ),
    );
  }
}
