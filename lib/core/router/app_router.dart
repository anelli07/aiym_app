import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/welcome_screen.dart';
import '../../features/auth/presentation/screens/sign_in_screen.dart';
import '../../features/auth/presentation/screens/sign_up_screen.dart';
import '../../features/home/presentation/screens/main_screen.dart';

class AppRouter {
  static const String welcome = '/welcome';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String home = '/home';
  static const String translation = '/translation';
  static const String dictionary = '/dictionary';
  static const String learn = '/learn';
  static const String quizzes = '/quizzes';

  static final GoRouter router = GoRouter(
    initialLocation: welcome,
    routes: [
      GoRoute(
        path: welcome,
        name: 'welcome',
        builder: (context, state) => const WelcomeScreen(),
        routes: [
          GoRoute(
            path: 'sign-in',
            name: 'sign-in',
            builder: (context, state) => const SignInScreen(),
          ),
          GoRoute(
            path: 'sign-up',
            name: 'sign-up',
            builder: (context, state) => const SignUpScreen(),
          ),
        ],
      ),
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) {
          // Определяем начальный индекс на основе пути
          int initialIndex = 0;
          final path = state.uri.path;
          if (path.contains('translation'))
            initialIndex = 1;
          else if (path.contains('dictionary'))
            initialIndex = 2;
          else if (path.contains('learn'))
            initialIndex = 3;
          else if (path.contains('quizzes'))
            initialIndex = 4;
          return MainScreen(initialIndex: initialIndex);
        },
      ),
    ],
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('Страница не найдена'))),
  );
}
