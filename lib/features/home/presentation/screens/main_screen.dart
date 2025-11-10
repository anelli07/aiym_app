import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'home_screen.dart';
import '../../../translation/presentation/screens/translation_screen.dart';
import '../../../dictionary/presentation/screens/dictionary_screen.dart';
import '../../../learn/presentation/screens/learn_screen.dart';
import '../../../quizzes/presentation/screens/quizzes_screen.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;

  const MainScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreenContent(),
          TranslationScreenContent(),
          DictionaryScreenContent(),
          LearnScreenContent(),
          QuizzesScreenContent(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.lightBackground,
          border: Border(top: BorderSide(color: AppColors.inputBorder)),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.lightBackground,
          selectedItemColor: AppColors.primaryTeal,
          unselectedItemColor: AppColors.secondaryText,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.translate),
              label: 'Translation',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Dictionary',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Learn'),
            BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quizzes'),
          ],
        ),
      ),
    );
  }
}

