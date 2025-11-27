import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isLoading = true;
  String? _phoneNumber;
  String? _userName;
  String? _userEmail;

  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;
  String? get phoneNumber => _phoneNumber;
  String? get userName => _userName;
  String? get userEmail => _userEmail;

  AuthProvider() {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    await Future.delayed(const Duration(seconds: 3)); // Splash screen duration
    
    final prefs = await SharedPreferences.getInstance();
    _isAuthenticated = prefs.getBool('isAuthenticated') ?? false;
    _phoneNumber = prefs.getString('phoneNumber');
    _userName = prefs.getString('userName');
    _userEmail = prefs.getString('userEmail');
    
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> sendOTP(String phoneNumber) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 1500));
    
    // In production, call actual API
    _phoneNumber = phoneNumber;
    return true;
  }

  Future<bool> verifyOTP(String otp) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 1500));
    
    // In production, verify with actual API
    if (otp.length == 6) {
      _isAuthenticated = true;
      _userName = 'Fleet Owner';
      _userEmail = 'owner@intrack.com';
      
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isAuthenticated', true);
      await prefs.setString('phoneNumber', _phoneNumber ?? '');
      await prefs.setString('userName', _userName ?? '');
      await prefs.setString('userEmail', _userEmail ?? '');
      
      notifyListeners();
      return true;
    }
    
    return false;
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    _phoneNumber = null;
    _userName = null;
    _userEmail = null;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    
    notifyListeners();
  }

  void skipAuth() {
    _isLoading = false;
    notifyListeners();
  }
}
