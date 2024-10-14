import 'package:dino_proto/src/model/enum/auth_form_mode.dart';
import 'package:dino_proto/src/theme/app_colors.dart';
import 'package:dino_proto/src/pages/auth/bloc/auth_page_bloc.dart';
import 'package:dino_proto/src/theme/buttons.dart';
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

class _AuthFormState extends State<AuthForm> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: AuthFormMode.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _goToLogin() {
    _tabController.animateTo(0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    FocusScope.of(context).unfocus();
  }

  void _goToRegister() {
    _tabController.animateTo(1,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    FocusScope.of(context).unfocus();
  }

  void _onTabChanged(int index) {
    final authBloc = context.read<AuthPageBloc>();
    FocusScope.of(context).unfocus();
    authBloc.add(AuthPageEvent.modeChanged(
      AuthFormMode.values[index],
    ));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = screenHeight * 0.3;
    final screenWidth = MediaQuery.of(context).size.width;
    const inputHeight = 56.0;
    const cartHeight = inputHeight * 5 + 16 * 4 + 48 + 32;
    const itemExtent = inputHeight + 16;
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              backgroundColor: AppColors.blue,
              expandedHeight: appBarHeight,
              toolbarHeight: appBarHeight,
              title: SvgPicture.asset(
                  height: appBarHeight,
                  'assets/images/illustrations/dino_with_star.svg'),
            ),
          )
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: [
          ...AuthFormMode.values.map((mode) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Builder(
                builder: (context) {
                  return CustomScrollView(
                    key: PageStorageKey<AuthFormMode>(mode),
                    slivers: [
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.all(8.0),
                        sliver: SliverToBoxAdapter(
                          child: (mode == AuthFormMode.register)
                              ? RegisterForm(
                                  screenWidth: screenWidth,
                                  email: widget.email,
                                  password: widget.password,
                                  onNeedAccount: _goToLogin)
                              : LoginForm(
                                  screenWidth: screenWidth,
                                  email: widget.email,
                                  password: widget.password,
                                  onHaveAccount: _goToRegister),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.screenWidth,
    required this.email,
    required this.password,
    required this.onHaveAccount,
  });

  final double screenWidth;
  final String? email;

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
              SizedBox(
                  height: 56,
                  width: double.infinity,
                  child:
                      Center(child: Text('Welcome back!', style: text.title))),
              TextFormField(
                initialValue: email,
                onChanged: (value) => context
                    .read<AuthPageBloc>()
                    .add(AuthPageEvent.mailChanged(value)),
                decoration: appInputDecoration.copyWith(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: password,
                onChanged: (value) => context
                    .read<AuthPageBloc>()
                    .add(AuthPageEvent.passwordChanged(value)),
                obscureText: true,
                decoration: appInputDecoration.copyWith(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: buttonHeight,
                child: ElevatedButton(
                  style: appElevatedButton,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    context
                        .read<AuthPageBloc>()
                        .add(AuthPageEvent.submit(AuthFormMode.login));
                  },
                  child: const Text('LOGIN'),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: buttonHeight,
                width: double.infinity,
                child: TextButton(
                    onPressed: onHaveAccount,
                    child: const Text('Don\'t have an account?\nRegister here',
                        textAlign: TextAlign.center)),
              ),
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
    required this.password,
    required this.onNeedAccount,
    this.name,
    this.passwordConfirmation,
  });

  final double screenWidth;
  final String? email;
  final String? name;
  final String? password;
  final String? passwordConfirmation;
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
              SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: Center(
                      child: Text('Create an account', style: text.title))),
              TextFormField(
                initialValue: name,
                onChanged: (value) => context
                    .read<AuthPageBloc>()
                    .add(AuthPageEvent.nameChanged(value)),
                decoration: appInputDecoration.copyWith(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: email,
                onChanged: (value) => context
                    .read<AuthPageBloc>()
                    .add(AuthPageEvent.mailChanged(value)),
                decoration: appInputDecoration.copyWith(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: password,
                onChanged: (value) => context
                    .read<AuthPageBloc>()
                    .add(AuthPageEvent.passwordChanged(value)),
                obscureText: true,
                decoration: appInputDecoration.copyWith(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: password,
                onChanged: (value) => context
                    .read<AuthPageBloc>()
                    .add(AuthPageEvent.passwordConfirmationChanged(value)),
                obscureText: true,
                decoration: appInputDecoration.copyWith(
                  labelText: 'Password confirmation',
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    context
                        .read<AuthPageBloc>()
                        .add(AuthPageEvent.submit(AuthFormMode.register));
                  },
                  style: appElevatedButton,
                  child: const Text('REGISTER'),
                ),
              ),
              const SizedBox(height: 16),
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
