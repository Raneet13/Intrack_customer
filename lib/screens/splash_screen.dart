import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _pulseController;
  late AnimationController _fadeController;
  late AnimationController _progressController;
  
  late Animation<double> _logoScale;
  late Animation<double> _logoRotation;
  late Animation<double> _pulseScale;
  late Animation<double> _pulseOpacity;
  late Animation<double> _fadeAnimation;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    
    // Logo animation
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    
    _logoScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );
    
    _logoRotation = Tween<double>(begin: -180.0, end: 0.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOut),
    );
    
    // Pulse animation
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
    
    _pulseScale = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeOut),
    );
    
    _pulseOpacity = Tween<double>(begin: 0.5, end: 0.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeOut),
    );
    
    // Fade animation
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );
    
    // Progress animation
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
    );
    
    // Start animations
    _logoController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      _fadeController.forward();
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      _progressController.forward();
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _pulseController.dispose();
    _fadeController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.trackingGradient,
        ),
        child: Stack(
          children: [
            // Animated Map Grid Background
            Positioned.fill(
              child: Opacity(
                opacity: 0.2,
                child: CustomPaint(
                  painter: GridPainter(),
                ),
              ),
            ),
            
            // GPS Pins
            _buildAnimatedPin(
              top: 80,
              left: 40,
              delay: 0,
              color: AppTheme.accentGreen,
            ),
            _buildAnimatedPin(
              top: 120,
              right: 60,
              delay: 500,
              color: AppTheme.primaryBlue,
            ),
            _buildAnimatedPin(
              bottom: 150,
              left: 80,
              delay: 1000,
              color: AppTheme.accentOrange,
            ),
            
            // Main Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo with pulse effect
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Pulse rings
                      AnimatedBuilder(
                        animation: _pulseController,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _pulseOpacity.value,
                            child: Transform.scale(
                              scale: _pulseScale.value,
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppTheme.accentGreen,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      
                      // Logo
                      AnimatedBuilder(
                        animation: _logoController,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _logoScale.value,
                            child: Transform.rotate(
                              angle: _logoRotation.value * 3.14159 / 180,
                              child: Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 30,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Image.asset("assets/intrack_logo.png", width: 52, height: 52,fit: BoxFit.contain,)
                              ),
                            ),
                          );
                        },
                      ),
                      
                      // Live indicator
                      Positioned(
                        top: 0,
                        right: 0,
                        child: AnimatedBuilder(
                          animation: _pulseController,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: 1.0 + (_pulseController.value * 0.2),
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: const BoxDecoration(
                                  color: AppTheme.accentGreen,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.wifi_tethering,
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // App Name
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      children: [
                        Text(
                          'IN-Track',
                          style: AppTheme.headingLarge.copyWith(
                            fontSize: 48,
                            color: Colors.white,
                            letterSpacing: -1,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 4,
                          width: 120,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                AppTheme.primaryBlue,
                                AppTheme.accentGreen,
                                AppTheme.accentOrange,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Real-Time Fleet Management',
                          style: AppTheme.bodyLarge.copyWith(
                            color: Colors.blue.shade200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 48),
                  
                  // Feature Icons
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildFeatureIcon(
                          Icons.location_on,
                          'Track',
                          AppTheme.primaryBlue,
                        ),
                        const SizedBox(width: 48),
                        _buildFeatureIcon(
                          Icons.navigation,
                          'Navigate',
                          AppTheme.accentGreen,
                        ),
                        const SizedBox(width: 48),
                        _buildFeatureIcon(
                          Icons.local_shipping,
                          'Manage',
                          AppTheme.accentOrange,
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 48),
                  
                  // Progress Bar
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        children: [
                          AnimatedBuilder(
                            animation: _progressAnimation,
                            builder: (context, child) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: _progressAnimation.value,
                                  backgroundColor: AppTheme.slate800,
                                  valueColor: const AlwaysStoppedAnimation(
                                    AppTheme.accentGreen,
                                  ),
                                  minHeight: 4,
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Powered by GPS Technology',
                            style: AppTheme.bodySmall.copyWith(
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildFeatureIcon(IconData icon, String label, Color color) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1500),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 8 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 20,
              color: color.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: AppTheme.caption.copyWith(
              color: color.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedPin({
    double? top,
    double? bottom,
    double? left,
    double? right,
    required int delay,
    required Color color,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: Duration(milliseconds: 1000 + delay),
        builder: (context, value, child) {
          return Opacity(
            opacity: 0.3 + (value * 0.3),
            child: Transform.translate(
              offset: Offset(0, 10 * (1 - value)),
              child: child,
            ),
          );
        },
        child: Icon(
          Icons.location_on,
          size: 24,
          color: color,
        ),
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.3)
      ..strokeWidth = 1;

    const gridSize = 50.0;
    
    // Draw vertical lines
    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }
    
    // Draw horizontal lines
    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
