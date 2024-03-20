import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/splash_cubit.dart';

class ScreenSplah extends StatelessWidget {
  const ScreenSplah({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(context),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          var cubit = context.read<SplashCubit>();
          return Scaffold(
            body: Center(
              child: Text('Splash'),
            ),
          );
        },
      ),
    );
  }
}
