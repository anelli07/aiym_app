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
                            onTapDown: (_) => setState(() => _isBackPressed = true),
                            onTapUp: (_) => setState(() => _isBackPressed = false),
                            onTapCancel: () => setState(() => _isBackPressed = false),
                            onTap: () => context.pop(),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              padding: EdgeInsets.all(_isBackPressed ? 14 : 12),
                              transform: Matrix4.identity()..scale(_isBackPressed ? 0.95 : 1.0),
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
                      
                      // Кнопки социальных сетей
                      Row(
                        children: [
                          Expanded(
                            child: _buildSocialButton(
                              'G',
                              'Google',
                              AppColors.googleRed,
                              () {},
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildSocialButton(
                              'f',
                              'Facebook',
                              AppColors.facebookBlue,
                              () {},
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildSocialButton(
                              '🍎',
                              'Apple',
                              AppColors.appleBlack,
                              () {},
                            ),
                          ),
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
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                color: AppColors.secondaryText,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            Text(
                              'Hide',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.secondaryText,
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
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
                              onPressed: () => context.go('/sign-up'),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                'Log In',
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

  Widget _buildSocialButton(String icon, String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.inputBorder),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              icon,
              style: TextStyle(
                fontSize: 20,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              text,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.primaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSignIn() {
    if (_formKey.currentState!.validate()) {
      // Здесь будет логика входа
      context.go('/home');
    }
  }
}
