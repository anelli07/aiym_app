import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/welcome_screen.dart';
import '../../features/auth/presentation/screens/sign_in_screen.dart';
import '../../features/auth/presentation/screens/sign_up_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/translation/presentation/screens/translation_screen.dart';
import '../../features/dictionary/presentation/screens/dictionary_screen.dart';
import '../../features/learn/presentation/screens/learn_screen.dart';
import '../../features/quizzes/presentation/screens/quizzes_screen.dart';

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
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'translation',
            name: 'translation',
            builder: (context, state) => const TranslationScreen(),
          ),
          GoRoute(
            path: 'dictionary',
            name: 'dictionary',
            builder: (context, state) => const DictionaryScreen(),
          ),
          GoRoute(
            path: 'learn',
            name: 'learn',
            builder: (context, state) => const LearnScreen(),
          ),
          GoRoute(
            path: 'quizzes',
            name: 'quizzes',
            builder: (context, state) => const QuizzesScreen(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('Страница не найдена'))),
  );
}
