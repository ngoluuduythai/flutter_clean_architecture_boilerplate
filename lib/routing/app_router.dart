import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_boilerplate/features/authentication/data/fake_auth_repository.dart';
import 'package:flutter_clean_architecture_boilerplate/features/authentication/presentation/account/account_screen.dart';
import 'package:flutter_clean_architecture_boilerplate/features/authentication/presentation/sign_in/email_password_sign_in_form_type.dart';
import 'package:flutter_clean_architecture_boilerplate/features/authentication/presentation/sign_in/email_password_sign_in_screen.dart';
import 'package:flutter_clean_architecture_boilerplate/routing/go_router_refresh_stream.dart';
import 'package:flutter_clean_architecture_boilerplate/routing/not_found_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_router.g.dart';

enum AppRoute {
  home,
  product,
  leaveReview,
  cart,
  checkout,
  orders,
  account,
  signIn,
}

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      final path = state.uri.path;
      if (isLoggedIn) {
        if (path == '/signIn') {
          return '/';
        }
      } else {
        if (path == '/account' || path == '/orders') {
          return '/';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) =>  Container(child: Text('Gau Ne'),),
        routes: [
          GoRoute(
            path: 'account',
            name: AppRoute.account.name,
            pageBuilder: (context, state) => const MaterialPage(
              fullscreenDialog: true,
              child: AccountScreen(),
            ),
          ),
          GoRoute(
            path: 'signIn',
            name: AppRoute.signIn.name,
            pageBuilder: (context, state) => const MaterialPage(
              fullscreenDialog: true,
              child: EmailPasswordSignInScreen(
                formType: EmailPasswordSignInFormType.signIn,
              ),
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
