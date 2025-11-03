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
          // Верхний заголовок с логотипом и streak счетчиком
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
                // Streak счетчик
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                            _buildDayIndicator('Mon', true),
                            _buildDayIndicator('Tue', false),
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
                  
                  // Основной контент "Pick up where you left off"
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
                        Text(
                          'Pick up where you left off',
                          style: AppTextStyles.headerSmall,
                        ),
                        const SizedBox(height: 20),
                        
                        // Иллюстрация с собакой
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: AppColors.tealBackground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.pets,
                              size: 100,
                              color: AppColors.primaryTeal,
                            ),
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
                            // Здесь будет логика начала обучения
                          },
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Баннер "Take a Quiz!"
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.tealBackground,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Take a Quiz!',
                                style: AppTextStyles.headerSmall,
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
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.lightText,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Start Quiz >',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.primaryTeal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
          border: Border(
            top: BorderSide(color: AppColors.inputBorder),
          ),
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
                context.go('/translation');
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

  Widget _buildDayIndicator(String day, bool isActive) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primaryTeal : Colors.transparent,
            border: Border.all(
              color: AppColors.primaryTeal,
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
            color: AppColors.secondaryText,
          ),
        ),
      ],
    );
  }
}
