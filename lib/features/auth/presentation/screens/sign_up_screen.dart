import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _agreeToTerms = false;
  bool _obscurePassword = true;
  bool _isBackPressed = false;

  @override
  void dispose() {
    _nameController.dispose();
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
                      Text(
                        'Create your account',
                        style: AppTextStyles.headerMedium,
                      ),
                      
                      const SizedBox(height: 8),
                      
                      // Ссылка на вход
                      Row(
                        children: [
                          Text(
                            'Already, have an account? ',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.secondaryText,
                            ),
                          ),
                          TextButton(
                            onPressed: () => context.go('/sign-in'),
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
                      
                      const SizedBox(height: 30),
                      
                      // Поле имени
                      AppTextField(
                        label: 'Your name',
                        hint: 'Enter your profile name',
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Поле email
                      AppTextField(
                        label: 'Email',
                        hint: 'Enter your email address',
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
                        label: 'Create a password',
                        hint: 'Enter your password',
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        suffixIcon: IconButton(
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                      ),
                      
                      const SizedBox(height: 8),
                      
                      // Требования к паролю
                      Text(
                        'Use 8 or more characters with a mix of letters, numbers & symbols',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.secondaryText,
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Согласие с условиями
                      AppCheckbox(
                        value: _agreeToTerms,
                        onChanged: (value) {
                          setState(() {
                            _agreeToTerms = value ?? false;
                          });
                        },
                        label: 'By creating an account, you agree to the Terms of use and Privacy Policy.',
                      ),
                      
                      const SizedBox(height: 30),
                      
                      // Кнопка регистрации
                      AppButton(
                        text: 'Create an account',
                        width: double.infinity,
                        onPressed: _agreeToTerms ? _handleSignUp : null,
                      ),
                      
                      const SizedBox(height: 30),
                      
                      // Разделитель
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'OR Continue with',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.secondaryText,
                              ),
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      
                      const SizedBox(height: 30),
                      
                      // Кнопки социальных сетей
                      _buildSocialButton(
                        'G',
                        'Google',
                        AppColors.googleRed,
                        () {},
                      ),
                      
                      const SizedBox(height: 12),
                      
                      _buildSocialButton(
                        'f',
                        'Facebook',
                        AppColors.facebookBlue,
                        () {},
                      ),
                      
                      const SizedBox(height: 12),
                      
                      _buildSocialButton(
                        '🍎',
                        'Apple',
                        AppColors.appleBlack,
                        () {},
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
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.inputBorder),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              icon,
              style: TextStyle(
                fontSize: 20,
                color: color,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: AppTextStyles.buttonMedium.copyWith(
                color: AppColors.primaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSignUp() {
    if (_formKey.currentState!.validate() && _agreeToTerms) {
      // Здесь будет логика регистрации
      context.go('/home');
    }
  }
}
