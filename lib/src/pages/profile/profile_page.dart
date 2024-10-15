import 'package:dino_proto/src/core/core_bloc.dart';
import 'package:dino_proto/src/pages/profile/bloc/profile_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfilePageBloc()..add(ProfilePageEvent.init()),
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
            loaded: (loaded) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      }),
    );
  }
}
