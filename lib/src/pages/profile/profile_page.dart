import 'package:dino_proto/src/core/core_bloc.dart';
import 'package:dino_proto/src/pages/profile/bloc/profile_page_bloc.dart';
import 'package:dino_proto/src/pages/profile/widgets/avatar.dart';
import 'package:dino_proto/src/service/di/di.dart';
import 'package:dino_proto/src/theme/app_colors.dart';
import 'package:dino_proto/src/theme/buttons.dart';
import 'package:dino_proto/src/theme/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProfilePageBloc>()..add(ProfilePageEvent.init()),
      child: BlocBuilder<ProfilePageBloc, ProfilePageState>(
          builder: (context, profileState) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.of(context).pushNamed('/settings');
                },
              ),
              IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    context.read<CoreBloc>().add(CoreEvent.setToken(null));
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/auth', (route) => false);
                  })
            ],
          ),
          body: profileState.map(
            init: (init) => const Center(child: CircularProgressIndicator()),
            loading: (loading) =>
                const Center(child: CircularProgressIndicator()),
            loaded: (loaded) => Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Avatar(
                      imageUrl: loaded.user?.avatar,
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      InfoBlock(
                        title: 'Name:',
                        content: loaded.user?.name ?? 'Anonimus',
                      ),
                      InfoBlock(
                        title: 'Email:',
                        content: loaded.user?.email ?? 'Hidden',
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: buttonHeight,
                        child: ElevatedButton(
                          style: appElevatedButton,
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            Navigator.of(context).pushNamed('/task');
                          },
                          child: const Text('TASK'),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class InfoBlock extends StatelessWidget {
  const InfoBlock({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.yellow,
        ),
        child: Row(
          children: [
            Text(
              title,
              style: text.title,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                content,
                style: text.subtitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
