import 'package:dino_proto/src/pages/profile/bloc/profile_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfilePageBloc(),
      child: BlocBuilder<ProfilePageBloc, ProfilePageState>(
          builder: (context, profileState) {
        return profileState.map(
          init: (init) => const Center(child: CircularProgressIndicator()),
          loading: (loading) =>
              const Center(child: CircularProgressIndicator()),
          loaded: (loaded) => const Center(child: CircularProgressIndicator()),
        );
      }),
    );
  }
}
