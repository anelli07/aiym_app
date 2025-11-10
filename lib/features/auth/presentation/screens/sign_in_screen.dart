import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _keepSignedIn = true;
  bool _isBackPressed = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Основная белая секция
          Expanded(
            child: Container(
              width: double.infinity,
              color: AppColors.lightBackground,
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      // Кнопка "Назад"
                      Row(
                        children: [
                          GestureDetector(
                            onTapDown: (_) =>
                                setState(() => _isBackPressed = true),
                            onTapUp: (_) =>
                                setState(() => _isBackPressed = false),
                            onTapCancel: () =>
                                setState(() => _isBackPressed = false),
                            onTap: () => context.pop(),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              padding: EdgeInsets.all(_isBackPressed ? 14 : 12),
                              transform: Matrix4.identity()
                                ..scale(_isBackPressed ? 0.95 : 1.0),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: AppColors.primaryText,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Заголовок
                      Center(
                        child: Text(
                          'Log in to your\naccount',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.headerMedium.copyWith(
                            color: AppColors.primaryTeal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Кнопки социальных сетей (в одну линию)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialButton(
                            _buildGoogleIcon(),
                            'Google',
                            () {},
                          ),
                          const SizedBox(width: 12),
                          _buildSocialButton(
                            _buildFacebookIcon(),
                            'Facebook',
                            () {},
                          ),
                          const SizedBox(width: 12),
                          _buildSocialButton(_buildAppleIcon(), 'Apple', () {}),
                        ],
                      ),

                      const SizedBox(height: 40),

                      // Поле email
                      AppTextField(
                        label: 'Email address',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // Поле пароля
                      AppTextField(
                        label: 'Your password',
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.secondaryText,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 8),

                      // Ссылка "Забыли пароль?"
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Здесь будет логика восстановления пароля
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Forget your password',
                            style: AppTextStyles.linkSmall,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Чекбокс "Запомнить меня"
                      AppCheckbox(
                        value: _keepSignedIn,
                        onChanged: (value) {
                          setState(() {
                            _keepSignedIn = value ?? false;
                          });
                        },
                        label: 'Keep me signed in until I sign out',
                      ),

                      const SizedBox(height: 30),

                      // Кнопка входа
                      AppButton(
                        text: 'Log in',
                        width: double.infinity,
                        onPressed: _handleSignIn,
                      ),

                      const SizedBox(height: 20),

                      // 🔧 ТЕСТОВЫЙ ЛОГИН (только для разработки)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primaryTeal.withOpacity(0.5),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextButton(
                          onPressed: () {
                            // Тестовый вход без проверки данных
                            context.go('/home');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.developer_mode,
                                size: 18,
                                color: AppColors.primaryTeal,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Test Login (Dev)',
                                style: AppTextStyles.buttonMedium.copyWith(
                                  color: AppColors.primaryTeal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Разделитель
                      const Divider(),

                      const SizedBox(height: 20),

                      // Ссылка на регистрацию
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account yet? ',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.secondaryText,
                              ),
                            ),
                            TextButton(
                              onPressed: () => context.go('/welcome/sign-up'),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                'Sign up',
                                style: AppTextStyles.link.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(Widget icon, String text, VoidCallback onPressed) {
    return Expanded(
      child: SizedBox(
        height: 56,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: AppColors.inputBorder),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(height: 4),
              Text(
                text,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.primaryText,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleIcon() {
    // Логотип Google - буква G в цветах Google
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFEA4335), // Red
            Color(0xFFFBBC05), // Yellow
            Color(0xFF34A853), // Green
            Color(0xFF4285F4), // Blue
          ],
        ),
      ),
      child: Center(
        child: Text(
          'G',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildFacebookIcon() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: AppColors.facebookBlue,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          'f',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildAppleIcon() {
    return Container(
      width: 24,
      height: 24,
      child: Icon(Icons.apple, color: AppColors.appleBlack, size: 24),
    );
  }

  void _handleSignIn() {
    if (_formKey.currentState!.validate()) {
      // Здесь будет логика входа
      context.go('/home');
    }
  }
}
