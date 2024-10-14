import 'package:dino_proto/src/theme/app_colors.dart';
import 'package:dino_proto/src/pages/auth/auth_form.dart';
import 'package:dino_proto/src/pages/auth/bloc/auth_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:floating_bubbles/floating_bubbles.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthPageBloc()..add(AuthPageEvent.init()),
      child: BlocBuilder<AuthPageBloc, AuthPageState>(
          builder: (context, authState) {
        return Scaffold(
          body: authState.map(
            init: (init) => const Center(child: CircularProgressIndicator()),
            loading: (loading) =>
                const Center(child: CircularProgressIndicator()),
            loaded: (loaded) => Stack(
              children: [
                Positioned.fill(
                  child: FloatingBubbles.alwaysRepeating(
                    noOfBubbles: 10,
                    colorsOfBubbles: const [
                      AppColors.pink,
                      AppColors.yellow,
                      AppColors.blue,
                    ],
                    sizeFactor: 0.49,
                    opacity: 100,
                    speed: BubbleSpeed.slow,
                    paintingStyle: PaintingStyle.fill,
                    shape: BubbleShape.circle, //This is the default
                  ),
                ),
                AuthForm(
                  email: loaded.mail,
                  password: loaded.password,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
