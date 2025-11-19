import 'package:flutter/material.dart';
import 'package:intrack_customer/screens/otp_validation_screen.dart';
import 'package:intrack_customer/screens/signup_screen.dart';
import 'package:intrack_customer/theme/app_colors.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  void _sendOtp() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OtpValidationScreen()),
            );
      // Navigator.pushNamed(
      //   context, 
      //   '/otp-validation',
      //   arguments: _phoneController.text,
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration:  BoxDecoration(gradient: AppColors.bluePurpleGradient),
          child: Column(
            children: [
              
              // Animated Background Elements
              Expanded(
                child: Stack(
                  children: [
                    // Background circles
                    Positioned(
                      top: -160,
                      right: -160,
                      child: Container(
                        width: 320,
                        height: 320,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: -80,
                      child: Container(
                        width: 240,
                        height: 240,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 80,
                      right: 40,
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
      
                    // Main Content
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 80),
                          
                          // Logo and Title Section
                          Column(
                            children: [
                              // Round Logo Container
                              Container(
                                width: 112,
                                height: 112,
                                margin: const EdgeInsets.only(bottom: 24),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 20,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Center(
                        child: Image.asset(
                          "assets/intrack3.png",
                          height: 88,
                          width: 88,
                          
                          errorBuilder: (context, error, stackTrace) => 
                              const Icon(Icons.error, size: 48, color: Colors.red)
                        ),
                      ),
                              ),
                              
                              const Text(
                                'Welcome',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Sign in to continue',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
      
                          // Login Form Card
                          Card(
                            elevation: 12,
                            color: Colors.white.withOpacity(0.95),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(32),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    // Mobile Number Input
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Mobile Number',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.gray700,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        TextFormField(
                                          controller: _phoneController,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                            hintText: 'Enter your mobile number',
                                            prefixIcon: const Icon(
                                              Icons.phone,
                                              color: AppColors.primary,
                                            ),
                                            filled: true,
                                            fillColor: AppColors.gray100,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                color: AppColors.gray200,
                                                width: 2,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                color: AppColors.gray200,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: const BorderSide(
                                                color: AppColors.primary,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter your mobile number';
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 24),
      
                                    // Send OTP Button
                                    SizedBox(
                                      width: double.infinity,
                                      height: 56,
                                      child: ElevatedButton(
                                        onPressed: _sendOtp,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.primary,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          elevation: 4,
                                        ),
                                        child: const Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.message, size: 20),
                                            SizedBox(width: 8),
                                            Text(
                                              'Send OTP',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 32),
      
                                    // Features Section
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: AppColors.gray200,
                                    ),
                                    const SizedBox(height: 24),
      
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue.withOpacity(0.1),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Icon(
                                                  Icons.security,
                                                  color: AppColors.primary,
                                                  size: 20,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              const Text(
                                                'Secure Login',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppColors.gray500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.green.withOpacity(0.1),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Icon(
                                                  Icons.flash_on,
                                                  color: AppColors.success,
                                                  size: 20,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              const Text(
                                                'Quick Service',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppColors.gray500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 24),
      
                                    // Create Account Link
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'New to In Track? ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.gray500,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () =>Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignupScreen()),
            ),
                                          child: const Text(
                                            'Create Account',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
      
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}