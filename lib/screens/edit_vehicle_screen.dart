import 'package:flutter/material.dart';
import '../models/vehicle.dart';
import 'add_vehicle_screen.dart';

class EditVehicleScreen extends StatelessWidget {
  final Vehicle vehicle;

  const EditVehicleScreen({
    Key? key,
    required this.vehicle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AddVehicleScreen(
      editingVehicle: vehicle,
    );
  }
}
