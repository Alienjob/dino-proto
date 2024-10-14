import 'package:dino_proto/src/theme/app_colors.dart';
import 'package:dino_proto/src/pages/auth/bloc/auth_page_bloc.dart';
import 'package:dino_proto/src/theme/inputs.dart';
import 'package:dino_proto/src/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key, required this.email, required this.password});

  final String? email;
  final String? password;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToLogin() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    FocusScope.of(context).unfocus();
  }

  void _goToRegister() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthPageBloc>();
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = screenHeight * 0.3;
    final screenWidth = MediaQuery.of(context).size.width;
    const inputHeight = 56.0;
    const cartHeight = inputHeight * 5 + 16 * 4 + 48 + 24;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: AppColors.blue,
          expandedHeight: appBarHeight,
          toolbarHeight: appBarHeight,
          title: SvgPicture.asset(
              height: appBarHeight,
              'assets/images/illustrations/dino_with_star.svg'),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(
                width: screenWidth,
                height: cartHeight,
                child: PageView(
                  onPageChanged: (_) {
                    FocusScope.of(context).unfocus();
                  },
                  controller: _pageController,
                  children: [
                    LoginForm(
                        screenWidth: screenWidth,
                        email: widget.email,
                        authBloc: authBloc,
                        password: widget.password,
                        onHaveAccount: _goToRegister),
                    RegisterForm(
                        screenWidth: screenWidth,
                        email: widget.email,
                        authBloc: authBloc,
                        password: widget.password,
                        onNeedAccount: _goToLogin),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.screenWidth,
    required this.email,
    required this.authBloc,
    required this.password,
    required this.onHaveAccount,
  });

  final double screenWidth;
  final String? email;
  final AuthPageBloc authBloc;
  final String? password;
  final void Function() onHaveAccount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: screenWidth * 0.1,
      ),
      child: Card(
        color: AppColors.blue.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'Welcome back!',
                style: text.title,
              ),
              const SizedBox(height: 30),
              TextFormField(
                initialValue: email,
                onChanged: (value) =>
                    authBloc.add(AuthPageEvent.mailChanged(value)),
                decoration: appInputDecoration.copyWith(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: password,
                onChanged: (value) =>
                    authBloc.add(AuthPageEvent.passwordChanged(value)),
                decoration: appInputDecoration.copyWith(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => authBloc.add(AuthPageEvent.submit()),
                child: const Text('Sign In'),
              ),
              TextButton(
                  onPressed: onHaveAccount,
                  child: const Text('Don\'t have an account?\nRegister here',
                      textAlign: TextAlign.center)),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.screenWidth,
    required this.email,
    required this.authBloc,
    required this.password,
    required this.onNeedAccount,
  });

  final double screenWidth;
  final String? email;
  final AuthPageBloc authBloc;
  final String? password;
  final void Function() onNeedAccount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: screenWidth * 0.1,
      ),
      child: Card(
        color: AppColors.blue.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'Create an account',
                style: text.title,
              ),
              const SizedBox(height: 30),
              TextFormField(
                initialValue: email,
                onChanged: (value) =>
                    authBloc.add(AuthPageEvent.mailChanged(value)),
                decoration: appInputDecoration.copyWith(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: password,
                onChanged: (value) =>
                    authBloc.add(AuthPageEvent.passwordChanged(value)),
                decoration: appInputDecoration.copyWith(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => authBloc.add(AuthPageEvent.submit()),
                child: const Text('Sign Up'),
              ),
              TextButton(
                  onPressed: onNeedAccount,
                  child: const Text('Already have an account?\nLogin here',
                      textAlign: TextAlign.center)),
            ],
          ),
        ),
      ),
    );
  }
}
