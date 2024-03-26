import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../home/view/screen_home.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.context) : super(SplashInitial()) {
    splash();
  } 
  BuildContext context;
 
  splash() async {
    Future.delayed(Duration(milliseconds: 500), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ScreenHome(),
      ));
      emit(SplashInitial());
    });
  }
}
