import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isLoading = true;
  String? _phoneNumber;
  String? _userName;
  String? _userEmail;
  String? _userId;

  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;
  String? get phoneNumber => _phoneNumber;
  String? get userName => _userName;
  String? get userEmail => _userEmail;
  String? get userId => _userId;

  final String _baseUrl = 'https://ointern.com/demo/intrack/UserApi';

  AuthProvider() {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isAuthenticated = prefs.getBool('isAuthenticated') ?? false;
    _phoneNumber = prefs.getString('phoneNumber');
    _userName = prefs.getString('userName');
    _userEmail = prefs.getString('userEmail');
    _userId = prefs.getString('userId');
    
    _isLoading = false;
    notifyListeners();
  }

  Future<Map<String, dynamic>> sendOTP(String phoneNumber) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/login'),
        body: {'phone': phoneNumber},
      );

      final data = json.decode(response.body);
      if (data['status'] == true) {
        _phoneNumber = phoneNumber;
        _userId = data['user_id'].toString();
        notifyListeners();
        return {'success': true, 'message': data['message']};
      } else {
        return {'success': false, 'message': data['message'] ?? 'Failed to send OTP'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Connection error: $e'};
    }
  }

  Future<Map<String, dynamic>> verifyOTP(String otp) async {
    if (_userId == null) {
      return {'success': false, 'message': 'User ID missing. Please request OTP again.'};
    }

    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/verifyotp'),
        body: {
          'user_id': _userId,
          'otp': otp,
        },
      );

      final responseData = json.decode(response.body);
      if (responseData['status'] == true) {
        final userData = responseData['data'];
        _isAuthenticated = true;
        _userName = userData['fullname'];
        _userEmail = userData['email'];
        _phoneNumber = userData['phone'];
        _userId = userData['id'].toString();

        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isAuthenticated', true);
        await prefs.setString('phoneNumber', _phoneNumber ?? '');
        await prefs.setString('userName', _userName ?? '');
        await prefs.setString('userEmail', _userEmail ?? '');
        await prefs.setString('userId', _userId ?? '');

        notifyListeners();
        return {'success': true, 'message': responseData['message']};
      } else {
        return {'success': false, 'message': responseData['message'] ?? 'Invalid OTP'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Connection error: $e'};
    }
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    _phoneNumber = null;
    _userName = null;
    _userEmail = null;
    _userId = null;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    
    notifyListeners();
  }

  void skipAuth() {
    _isLoading = false;
    notifyListeners();
  }
}
