import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String _selectedLanguage = 'EN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Верхняя бирюзовая секция (70% высоты)
          Expanded(
            flex: 7,
            child: Container(
              width: double.infinity,
              color: AppColors.primaryTeal, // Однотонный бирюзовый фон
              child: Stack(
                children: [
                  // Логотип AI-YM в верхнем левом углу
                  Positioned(
                    top: 60,
                    left: 20,
                    child: Row(
                      children: [
                        // Новый логотип с тремя руками и кнопкой play
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.lightText,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/logo.png',
                              width: 40,
                              height: 40,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                // Если картинка не найдена, показываем иконку
                                return Icon(
                                  Icons.play_arrow,
                                  color: AppColors.primaryTeal,
                                  size: 24,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'AI-YM',
                          style: AppTextStyles.headerMedium.copyWith(
                            color: AppColors.lightText,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Выбор языка в верхнем правом углу
                  Positioned(
                    top: 60,
                    right: 20,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Выберите язык',
                                  style: AppTextStyles.headerSmall,
                                ),
                                const SizedBox(height: 20),
                                _buildLanguageOption('EN', 'English'),
                                _buildLanguageOption('KZ', 'Қазақша'),
                                _buildLanguageOption('RU', 'Русский'),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.lightText.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _selectedLanguage,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.lightText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.lightText,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Центральное изображение собачки с ракетой
                  Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColors.lightText,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/dog_rocket.png',
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.rocket_launch,
                              size: 100,
                              color: AppColors.primaryTeal,
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  // Слоган внизу синего фона
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Text(
                      'Learn a sign language\nin 3 minutes a day',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headerMedium.copyWith(
                        color: AppColors.lightText,
                        fontWeight: FontWeight.normal,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Нижняя белая секция (30% высоты)
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              color: AppColors.lightBackground,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Кнопка "Start learning"
                  AppButton(
                    text: 'Start learning',
                    width: double.infinity,
                    onPressed: () => context.go('/welcome/sign-up'),
                  ),

                  const SizedBox(height: 20),

                  // Ссылка "I have an account"
                  TextButton(
                    onPressed: () => context.go('/welcome/sign-in'),
                    child: Text(
                      'I have an account',
                      style: AppTextStyles.link.copyWith(
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String code, String name) {
    return ListTile(
      title: Text(name),
      trailing: _selectedLanguage == code
          ? Icon(Icons.check, color: AppColors.primaryTeal)
          : null,
      onTap: () {
        setState(() {
          _selectedLanguage = code;
        });
        Navigator.pop(context);
      },
    );
  }
}
