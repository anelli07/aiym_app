import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Верхний заголовок с логотипом, streak счетчиком и кнопкой Profile
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Логотип AI-YM
                Row(
                  children: [
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
                            return Icon(
                              Icons.gesture,
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
                        color: AppColors.primaryText,
                      ),
                    ),
                  ],
                ),
                // Streak счетчик и кнопка Profile
                Row(
                  children: [
                    // Streak счетчик
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryTeal.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.local_fire_department,
                            color: AppColors.primaryTeal,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '0',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Кнопка Profile
                    GestureDetector(
                      onTap: () {
                        // Здесь будет переход на страницу профиля
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.avatarBackground,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          color: AppColors.secondaryText,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Основной контент
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Streak секция
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.lightBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.inputBorder),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Finish 1 lesson to begin your streak',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.secondaryText,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Календарь дней недели
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildDayIndicator('Mon', false),
                            _buildDayIndicator('Tue', true), // Активный день
                            _buildDayIndicator('Wed', false),
                            _buildDayIndicator('Thu', false),
                            _buildDayIndicator('Fri', false),
                            _buildDayIndicator('Sat', false),
                            _buildDayIndicator('Sun', false),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Секция "Pick up where you left off"
                  Text(
                    'Pick up where you left off',
                    style: AppTextStyles.headerSmall,
                  ),
                  const SizedBox(height: 16),

                  // Карточка с курсом (собачка)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.lightBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.inputBorder),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Видеоплеер с собакой
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF9C4), // Светло-желтый фон
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Stack(
                            children: [
                              // Изображение собачки
                              Center(
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.lightText,
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/dog_rocket.png',
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Icon(
                                              Icons.pets,
                                              size: 80,
                                              color: AppColors.primaryTeal,
                                            );
                                          },
                                    ),
                                  ),
                                ),
                              ),
                              // Кнопка Play
                              Center(
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: AppColors.lightText,
                                    size: 40,
                                  ),
                                ),
                              ),
                              // Прогресс бар внизу
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(color: Colors.red),
                                      ),
                                      Container(
                                        width: 20,
                                        color: Colors.red.shade700,
                                        child: Center(
                                          child: Icon(
                                            Icons.pause,
                                            size: 12,
                                            color: AppColors.lightText,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Информация о курсе
                        Row(
                          children: [
                            Text(
                              '17 levels',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.secondaryText,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 4,
                              height: 4,
                              decoration: const BoxDecoration(
                                color: AppColors.secondaryText,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '24 hours',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.secondaryText,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Text(
                          'Introduction to Sign Language',
                          style: AppTextStyles.headerSmall,
                        ),

                        const SizedBox(height: 20),

                        // Кнопка "Start learning"
                        AppButton(
                          text: 'Start learning',
                          width: double.infinity,
                          onPressed: () {
                            context.go('/home/learn');
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Секция "Take a Quiz!"
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.primaryTeal.withOpacity(
                        0.1,
                      ), // Голубоватый фон
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        // Декоративные жесты рук на фоне (полупрозрачные белые)
                        // Жест "Рок" (указательный и мизинец вверх)
                        Positioned(
                          top: 10,
                          right: 20,
                          child: Opacity(
                            opacity: 0.2,
                            child: Icon(
                              Icons.thumb_up,
                              size: 40,
                              color: AppColors.lightText,
                            ),
                          ),
                        ),
                        // Жест "Любовь" (большой и указательный палец)
                        Positioned(
                          bottom: 10,
                          left: 30,
                          child: Opacity(
                            opacity: 0.2,
                            child: Icon(
                              Icons.favorite,
                              size: 35,
                              color: AppColors.lightText,
                            ),
                          ),
                        ),
                        // Жест "Привет" (рука вверх)
                        Positioned(
                          top: 50,
                          left: 50,
                          child: Opacity(
                            opacity: 0.2,
                            child: Icon(
                              Icons.pan_tool,
                              size: 30,
                              color: AppColors.lightText,
                            ),
                          ),
                        ),
                        // Жест "Окей" (круг)
                        Positioned(
                          top: 80,
                          right: 60,
                          child: Opacity(
                            opacity: 0.2,
                            child: Icon(
                              Icons.check_circle_outline,
                              size: 25,
                              color: AppColors.lightText,
                            ),
                          ),
                        ),
                        // Жест "Зайчик" (указательный и средний вверх)
                        Positioned(
                          bottom: 40,
                          right: 40,
                          child: Opacity(
                            opacity: 0.2,
                            child: Icon(
                              Icons.back_hand,
                              size: 28,
                              color: AppColors.lightText,
                            ),
                          ),
                        ),
                        // Основной контент
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: AppColors.lightText,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Take a Quiz!',
                                            style: AppTextStyles.headerSmall
                                                .copyWith(
                                                  color: AppColors.primaryTeal,
                                                ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Test your sign language skills and earn stars',
                                        style: AppTextStyles.bodySmall.copyWith(
                                          color: AppColors.secondaryText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                // Кнопка "Start Quiz"
                                GestureDetector(
                                  onTap: () {
                                    context.go('/home/quizzes');
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.lightText,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Start Quiz',
                                          style: AppTextStyles.bodySmall
                                              .copyWith(
                                                color: AppColors.primaryTeal,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        const SizedBox(width: 4),
                                        Icon(
                                          Icons.arrow_forward,
                                          size: 16,
                                          color: AppColors.primaryTeal,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 100), // Отступ для нижней навигации
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
          border: Border(top: BorderSide(color: AppColors.inputBorder)),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.lightBackground,
          selectedItemColor: AppColors.primaryTeal,
          unselectedItemColor: AppColors.secondaryText,
          currentIndex: 0, // Home активен
          onTap: (index) {
            switch (index) {
              case 0:
                // Уже на Home
                break;
              case 1:
                context.go('/home/translation');
                break;
              case 2:
                context.go('/home/dictionary');
                break;
              case 3:
                context.go('/home/learn');
                break;
              case 4:
                context.go('/home/quizzes');
                break;
            }
          },
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

  Widget _buildDayIndicator(String day, bool isActive) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primaryTeal : Colors.transparent,
            border: Border.all(
              color: isActive ? AppColors.primaryTeal : AppColors.secondaryText,
              width: 2,
            ),
            shape: BoxShape.circle,
          ),
          child: isActive
              ? Icon(
                  Icons.local_fire_department,
                  color: AppColors.lightText,
                  size: 20,
                )
              : null,
        ),
        const SizedBox(height: 8),
        Text(
          day,
          style: AppTextStyles.caption.copyWith(
            color: isActive ? AppColors.primaryTeal : AppColors.secondaryText,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        const SizedBox(height: 4),
        // Иконка огня под каждым днем
        Icon(
          Icons.local_fire_department,
          size: 16,
          color: isActive ? AppColors.primaryTeal : AppColors.secondaryText,
        ),
      ],
    );
  }
}
