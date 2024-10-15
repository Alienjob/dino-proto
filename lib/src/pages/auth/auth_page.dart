import 'package:dino_proto/src/core/core_bloc.dart';
import 'package:dino_proto/src/pages/profile/profile_page.dart';
import 'package:dino_proto/src/sample_feature/sample_item_list_view.dart';
import 'package:dino_proto/src/service/di/di.dart';
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
    return BlocListener<CoreBloc, CoreState>(
      listener: (context, coreState) {
        if (coreState.token != null) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(ProfilePage.routeName, (route) => false);
        }
      },
      child: BlocProvider(
        create: (context) => getIt<AuthPageBloc>()..add(AuthPageEvent.init()),
        child: BlocConsumer<AuthPageBloc, AuthPageState>(
            listenWhen: (previous, current) => current.error != null,
            listener: (context, authState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(authState.error!),
                ),
              );
            },
            buildWhen: (previous, current) =>
                previous.visibleVersion != current.visibleVersion,
            builder: (context, authState) {
              return Scaffold(
                body: authState.map(
                  init: (init) =>
                      const Center(child: CircularProgressIndicator()),
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
                        name: loaded.name,
                        passwordConfirmation: loaded.passwordConfirmation,
                        isAuthorized: loaded.isAuthorized,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
