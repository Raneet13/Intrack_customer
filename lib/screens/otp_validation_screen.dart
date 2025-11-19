import 'package:flutter/material.dart';
import 'package:intrack_customer/screens/home_screen.dart';
import 'package:intrack_customer/theme/app_colors.dart';
import 'dart:async';
import '../theme/app_theme.dart';

class OtpValidationScreen extends StatefulWidget {
  const OtpValidationScreen({super.key});

  @override
  State<OtpValidationScreen> createState() => _OtpValidationScreenState();
}

class _OtpValidationScreenState extends State<OtpValidationScreen> {
  final List<TextEditingController> _otpControllers = 
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  
  Timer? _timer;
  int _otpTimer = 30;
  bool _canResendOtp = false;
  String _phoneNumber = '';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as String?;
    if (args != null) {
      _phoneNumber = args;
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_otpTimer > 0) {
        setState(() {
          _otpTimer--;
        });
      } else {
        setState(() {
          _canResendOtp = true;
        });
        timer.cancel();
      }
    });
  }

  void _verifyOtp() {
    String otp = _otpControllers.map((controller) => controller.text).join();
    if (otp.length == 4) {
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
      // Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
    }
  }

  void _resendOtp() {
    setState(() {
      _otpTimer = 30;
      _canResendOtp = false;
    });
    for (var controller in _otpControllers) {
      controller.clear();
    }
    _startTimer();
  }

  void _onOtpChanged(int index, String value) {
    if (value.length == 1) {
      if (index < 5) {
        _focusNodes[index + 1].requestFocus();
      }
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    // Check if all fields are filled
    bool allFilled = _otpControllers.every((controller) => controller.text.isNotEmpty);
    if (allFilled) {
      _verifyOtp();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(gradient: AppColors.indigoPurpleGradient),
        child: Column(
          children: [
            // const AndroidStatusBar(backgroundColor: AppColors.primaryIndigo),
            
            Expanded(
              child: Stack(
                children: [
                  // Background circles
                  Positioned(
                    top: 40,
                    right: 40,
                    child: Container(
                      width: 128,
                      height: 128,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 80,
                    left: 40,
                    child: Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),

                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 80),
                        
                        // Header
                        Column(
                          children: [
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
                              'Enter OTP',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                // color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'We\'ve sent a verification code to',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black38,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              _phoneNumber,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),

                        // OTP Form Card
                        Card(
                          elevation: 12,
                          color: Colors.white.withOpacity(0.95),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              children: [
                                // OTP Input Fields
                                const Text(
                                  'Verification Code',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.gray700,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  // spacing: 12,
                                  children: List.generate(4, (index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: SizedBox(
                                        width: 58,
                                        height: 56,
                                        child: TextFormField(
                                          controller: _otpControllers[index],
                                          
                                          focusNode: _focusNodes[index],
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          maxLength: 1,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            filled: true,
      fillColor: Colors.white,
                                            counterText: '',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              borderSide: const BorderSide(
                                                color: AppColors.gray200,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8),
                                              borderSide:  BorderSide(
                                                color: AppColors.vehicleIdle,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                          onChanged: (value) => _onOtpChanged(index, value),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                const SizedBox(height: 24),

                                // Timer
                                if (_otpTimer > 0)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.timer,
                                        size: 16,
                                        color: AppColors.gray500,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Resend OTP in ${_otpTimer}s',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: AppColors.gray500,
                                        ),
                                      ),
                                    ],
                                  )
                                else
                                  TextButton(
                                    onPressed: _resendOtp,
                                    child: const Text(
                                      'Resend OTP',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.vehicleIdle,
                                      ),
                                    ),
                                  ),
                                
                                const SizedBox(height: 24),

                                // Verify Button
                                SizedBox(
                                  width: double.infinity,
                                  height: 56,
                                  child: ElevatedButton(
                                    onPressed: _verifyOtp,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryDark,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.check, size: 20),
                                        SizedBox(width: 8),
                                        Text(
                                          'Verify & Continue',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),

                                // Change Phone Number
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.arrow_back,
                                        size: 16,
                                        color: AppColors.gray500,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'Change Phone Number',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.gray500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Security Note
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.security,
                                size: 16,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Your information is secure and encrypted',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}