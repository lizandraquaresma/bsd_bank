import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provide_it/provide_it.dart';

import 'app_analytics.dart';
import 'features/account/view_models/account_view_model.dart';
import 'features/account/views/transaction_view.dart';
import 'features/auth/view_models/auth_store.dart';
import 'features/auth/views/forgot_password_page.dart';
import 'features/auth/views/initial_page.dart';
import 'features/auth/views/login_page.dart';
import 'features/auth/views/register_page.dart';
import 'features/user/view_models/user_view_model.dart';
import 'features/user/views/home_page.dart';
import 'features/user/views/user_shell.dart';

extension AppRouter on GoRouter {
  static final config = GoRouter(
    routes: [
      GoRoute(
        /// Por padrão, o [GoRouter] tentará sempre acessar a rota '/'.
        /// Caso o usuário esteja logado, será redirecionado para a rota '/home'.
        path: '/',
        redirect: (context, __) async {
          final authStore = context.read<AuthStore>();
          final isLogged = await authStore.check();

          return isLogged ? '/home' : null;
        },
        name: InitialPage.name,
        builder: (_, __) => const InitialPage(),
        routes: [
          GoRoute(
            path: 'login',
            name: LoginPage.name,
            builder: (_, __) => const LoginPage(),
            routes: [
              GoRoute(
                path: 'forgot-password',
                name: ForgotPasswordPage.name,
                builder: (_, __) => const ForgotPasswordPage(),
              ),
            ],
          ),
          GoRoute(
            path: 'register',
            name: RegisterPage.name,
            builder: (_, __) => const RegisterPage(),
          ),
        ],
      ),
      ShellRoute(
        /// O [UserShell] envolve todas as telas filhas, adicionando elementos
        /// como barra de navegação ou menu lateral. Ficarão sempre visíveis.
        builder: (context, __, child) {
          context.provide(UserViewModel.new);

          return UserShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            name: HomePage.name,
            builder: (context, __) {
              final user = readIt<UserViewModel>().user;
              context.provide(
                AccountViewModel.new,
                parameters: {
                  'bank': user.bankNumber,
                  'agency': user.agencyNumber,
                  'account': user.accountNumber,
                },
              );

              return const HomePage();
            },
          ),
          GoRoute(
            path: '/transaction',
            name: TransactionView.name,
            builder: (_, __) => const TransactionView(),
          ),
        ],
      ),
    ],
  )..addAnalytics();

  /// Acesso rápido as configurações da rota atual.
  RouteMatchList get current => routerDelegate.currentConfiguration;

  /// Conecta o [GoRouter] com o [AppAnalytics], para que ele possa escutar as
  /// mudanças de rota e enviar os eventos de navegação.
  void addAnalytics() {
    routerDelegate.addListener(() {
      AppAnalytics.logScreen(
        name: current.last.route.name,
        path: current.fullPath,
        parameters: current.pathParameters,
      );
    });
  }
}

class PatientStore {
  PatientStore({required this.patientId});
  final String patientId;
}

extension AppRouterExtension on BuildContext {
  /// Acesso rápido as configurações da rota atual.
  ///
  /// Caso você precise reagir a mudanças de rota ou fazer uma gerência de
  /// estado, use o [GoRouterState.of]. Esse método irá automaticamente
  /// atualizar o widget quando a rota mudar, assim como o [watch] faz.
  ///
  RouteMatchList get route => GoRouter.of(this).current;

  /// Id do usuário logado.
  String? get userId => read<UserViewModel?>()?.user.correlationId;
  // int? get agency => read<UserViewModel?>()?.user.agencyNumber;
  // String? get account => read<UserViewModel?>()?.user.accountNumber;
  // int? get bank => read<UserViewModel?>()?.user.bankNumber;

  String? get exampleId => route.pathParameters['exampleId'];
}
