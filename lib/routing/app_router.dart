import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_boilerplate/common_widgets/navigation/scaffold_with_nested_navigation.dart';
import 'package:flutter_clean_architecture_boilerplate/features/authentication/data/fake_auth_repository.dart';
import 'package:flutter_clean_architecture_boilerplate/features/authentication/presentation/sign_in/email_password_sign_in_form_type.dart';
import 'package:flutter_clean_architecture_boilerplate/features/authentication/presentation/sign_in/email_password_sign_in_screen.dart';
import 'package:flutter_clean_architecture_boilerplate/features/post/presentation/post_list_screen.dart';
import 'package:flutter_clean_architecture_boilerplate/features/product/product_screen.dart';
import 'package:flutter_clean_architecture_boilerplate/features/profile/profile_screen.dart';
import 'package:flutter_clean_architecture_boilerplate/features/scan/scan_screen.dart';
import 'package:flutter_clean_architecture_boilerplate/routing/go_router_refresh_stream.dart';
import 'package:flutter_clean_architecture_boilerplate/routing/not_found_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_router.g.dart';

enum AppRoute {
  signIn,
  post,
  product,
  scan,
  profile,
}

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _productNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'product');
final _scanNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'scan');
final _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);

  return GoRouter(
    initialLocation: '/product',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    // TODO: Implement user authentication check
    // redirect: (context, state) {
    //   final isLoggedIn = authRepository.currentUser != null;
    //   final path = state.uri.path;
    //   if (isLoggedIn) {
    //     if (path == '/signIn') {
    //       return '/product';
    //     }
    //   } else {
    //     return '/signIn';
    //   }
    //   return null;
    // },
    // refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      GoRoute(
        path: '/post',
        name: AppRoute.post.name,
        pageBuilder: (context, state) => const MaterialPage(
          fullscreenDialog: true,
          child: PostListScreen(),
        ),
      ),
      GoRoute(
        path: '/signIn',
        name: AppRoute.signIn.name,
        pageBuilder: (context, state) => const MaterialPage(
          fullscreenDialog: true,
          child: EmailPasswordSignInScreen(
            formType: EmailPasswordSignInFormType.signIn,
          ),
        ),
      ),
      // Stateful navigation based on:
      // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _productNavigatorKey,
            routes: [
              GoRoute(
                path: '/product',
                name: AppRoute.product.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProductScreen(),
                ),
                routes: const [
                  // /product/details
                  // GoRoute(
                  //   path: 'details',
                  //   builder: (context, state) =>
                  //       const ProductScreenDetail(),
                  // ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _scanNavigatorKey,
            routes: [
              // Shopping Cart
              GoRoute(
                path: '/scan',
                name: AppRoute.scan.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ScanScreen()),
                routes: const [
                  // /scan/details
                  // GoRoute(
                  //   path: 'details',
                  //   builder: (context, state) =>
                  //       const ScanScreenDetail(),
                  // ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _profileNavigatorKey,
            routes: [
              GoRoute(
                path: '/profile',
                name: AppRoute.profile.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProfileScreen()),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
