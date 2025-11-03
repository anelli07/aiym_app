import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_text_field.dart';

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  bool _isSignToText = true; // true = Sign to text, false = Text to sign
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Верхний заголовок с логотипом
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Row(
              children: [
                // Логотип AI-YM
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primaryTeal,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.gesture,
                        color: AppColors.lightText,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'AI-YM',
                      style: AppTextStyles.headerMedium.copyWith(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Основной контент
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Переключатель режимов
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.inputBorder,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _isSignToText = true),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                color: _isSignToText ? AppColors.primaryTeal : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Sign to text',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.buttonMedium.copyWith(
                                  color: _isSignToText ? AppColors.lightText : AppColors.primaryText,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _isSignToText = false),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                color: !_isSignToText ? AppColors.primaryTeal : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Text to sign',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.buttonMedium.copyWith(
                                  color: !_isSignToText ? AppColors.lightText : AppColors.primaryText,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Область для ввода/отображения
                  if (_isSignToText) ...[
                    // Sign to text - область для видео
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: AppColors.lightBackground,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.inputBorder),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.videocam,
                              size: 60,
                              color: AppColors.secondaryText,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Camera will appear here',
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ] else ...[
                    // Text to sign - поле ввода
                    AppTextField(
                      hint: 'Type your text or speak using the microphone',
                      controller: _textController,
                      maxLines: 4,
                      suffixIcon: Icon(
                        Icons.mic,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                  
                  const SizedBox(height: 20),
                  
                  // Область для результата
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: AppColors.lightBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.inputBorder),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.translate,
                            size: 60,
                            color: AppColors.secondaryText,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Your translation will appear here',
                            style: TextStyle(
                              color: AppColors.secondaryText,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Кнопки управления
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.red),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.stop, color: Colors.red),
                              const SizedBox(width: 8),
                              Text(
                                'Stop',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.green),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.play_arrow, color: Colors.green),
                              const SizedBox(width: 8),
                              Text(
                                'Start',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.blue),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.refresh, color: Colors.blue),
                              const SizedBox(width: 8),
                              Text(
                                'Reset',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Нижняя навигация
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.lightBackground,
          border: Border(
            top: BorderSide(color: AppColors.inputBorder),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.lightBackground,
          selectedItemColor: AppColors.primaryTeal,
          unselectedItemColor: AppColors.secondaryText,
          currentIndex: 1, // Translation активен
          onTap: (index) {
            switch (index) {
              case 0:
                context.go('/home');
                break;
              case 1:
                // Уже на Translation
                break;
              case 2:
                context.go('/dictionary');
                break;
              case 3:
                context.go('/learn');
                break;
              case 4:
                // Profile
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.translate),
              label: 'Translation',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Dictionary',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Learn',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
