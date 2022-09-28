import 'package:booking_app/features/auth/presentation/pages/profile/pages/profile/profile_page.dart';
import 'package:booking_app/features/hotels/presentation/pages/home/home_page.dart';
import 'package:booking_app/features/hotels/presentation/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get (context) => BlocProvider.of(context);


  int curIndex = 0 ;

  List<Widget> pages = [
    const HomePage(),
    const SettingsPage(),
    const ProfilePage(),
  ];

  void changeBottomNavigation (int index){
    curIndex = index;
    emit(BottomNavigationBarChangeState());
  }
}
