import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_header.dart';

class QuizzesScreen extends StatelessWidget {
  const QuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const QuizzesScreenContent();
  }
}

class QuizzesScreenContent extends StatelessWidget {
  const QuizzesScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Верхний заголовок с логотипом, streak счетчиком и кнопкой Profile
        const AppHeader(),
        // Основной контент
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.quiz, size: 100, color: AppColors.primaryTeal),
                const SizedBox(height: 20),
                Text('Quizzes Screen', style: AppTextStyles.headerMedium),
                const SizedBox(height: 10),
                Text(
                  'Экран будет реализован позже',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.secondaryText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
