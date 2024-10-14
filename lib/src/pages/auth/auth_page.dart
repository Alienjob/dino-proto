import 'package:dino_proto/src/pages/auth/bloc/auth_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthPageBloc(),
      child: BlocBuilder<AuthPageBloc, AuthPageState>(
          builder: (context, authState) {
        return authState.map(
          init: (init) => const Center(child: CircularProgressIndicator()),
          loading: (loading) =>
              const Center(child: CircularProgressIndicator()),
          loaded: (loaded) => const Center(child: CircularProgressIndicator()),
        );
      }),
    );
  }
}
