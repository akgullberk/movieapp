import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/helper/navigation/app_navigation.dart';
import 'package:movieapp/core/configs/assets/app_images.dart';
import 'package:movieapp/features/auth/presentation/pages/signin.dart';
import 'package:movieapp/features/home/presentation/pages/home.dart';
import 'package:movieapp/features/splash/presantation/bloc/splash_cubit.dart';
import 'package:movieapp/features/splash/presantation/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is Unauthenticated) {
            AppNavigator.pushReplacement(context,  SigninPage());
          }
          if (state is Authenticated) {
            AppNavigator.pushReplacement(context, const HomePage());
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.splashBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x001A1B20), // 0.0 opacity
                    Color(0xFF1A1B20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
