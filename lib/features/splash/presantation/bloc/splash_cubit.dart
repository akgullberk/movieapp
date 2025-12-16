import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/features/splash/presantation/bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(Unauthenticated());
  }
}
