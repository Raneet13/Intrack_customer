import 'package:flutter/material.dart';
import '../models/driver.dart';
import 'add_driver_screen.dart';

class EditDriverScreen extends StatelessWidget {
  final Driver driver;

  const EditDriverScreen({super.key, required this.driver});

  @override
  Widget build(BuildContext context) {
    return AddDriverScreen(editingDriver: driver);
  }
}
