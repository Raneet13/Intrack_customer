import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_header.dart';
import '../models/vehicle.dart';

class AddVehicleScreen extends StatefulWidget {
  final Vehicle? editingVehicle;

  const AddVehicleScreen({super.key, this.editingVehicle});

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _vehicleName;
  late TextEditingController _plateNumberController;
  late TextEditingController _makeController;
  late TextEditingController _modelController;
  late TextEditingController _yearController;
  late TextEditingController _driverController;
  late TextEditingController _phoneController;

  late String _vehicleType;
  late String _selectDriverName;
  final List<String> _selectDriver = [
    'Dibyajyoti',
    'Ranjan',
    'Padmanav',
    'Bablu',
  ];
  final List<String> _vehicleTypes = ['Car', 'Truck', 'Van', 'Bus'];

  @override
  void initState() {
    super.initState();
    // Initialize controllers with editing data if available
    _vehicleName = TextEditingController(
      text: widget.editingVehicle?.name ?? '',
    );
    _plateNumberController = TextEditingController(
      text: widget.editingVehicle?.plateNumber ?? '',
    );
    _makeController = TextEditingController(
      text: widget.editingVehicle?.make ?? '',
    );
    _modelController = TextEditingController(
      text: widget.editingVehicle?.model ?? '',
    );
    _yearController = TextEditingController(
      text: widget.editingVehicle?.year.toString() ?? '',
    );
    _driverController = TextEditingController(
      text: widget.editingVehicle?.driverName ?? '',
    );
    _phoneController = TextEditingController(
      text: widget.editingVehicle?.driverPhone ?? '',
    );
    _vehicleType = 'Car';
    _selectDriverName = 'Dibyajyoti';
  }

  @override
  void dispose() {
    _plateNumberController.dispose();
    _makeController.dispose();
    _modelController.dispose();
    _yearController.dispose();
    _driverController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.editingVehicle != null;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: MobileHeader(
        title: isEditing ? 'Edit Vehicle' : 'Add Vehicle',
        subtitle: isEditing
            ? 'Update ${widget.editingVehicle!.plateNumber}'
            : 'Enter vehicle details',
        canGoBack: true,
        action: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 8.0),
          //   child: ElevatedButton.icon(
          //     onPressed: _saveVehicle,
          //     icon: const Icon(Icons.save, size: 16),
          //     label: const Text('Save'),
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: AppColors.primary,
          //       foregroundColor: Colors.white,
          //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          //       textStyle: const TextStyle(fontSize: 14),
          //     ),
          //   ),
          // ),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Vehicle Details Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Vehicle Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text("Vehicle Name *"),
                        const SizedBox(height: 4),
                        TextFormField(
                          readOnly: true,
                          controller: _vehicleName,
                          decoration: InputDecoration(
                            // labelText: 'Plate Number *',
                            hintText: 'Fleet Truck 01',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter plate number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Text("Vehicle Type *"),
                        const SizedBox(height: 4),
                        DropdownButtonFormField<String>(
                          initialValue: _vehicleType,

                          decoration: InputDecoration(
                            // labelText: 'Vehicle Type *',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          items: _vehicleTypes.map((type) {
                            return DropdownMenuItem(
                              enabled: false,
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _vehicleType = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        Text("Plate Number *"),
                        const SizedBox(height: 4),
                        TextFormField(
                          readOnly: true,
                          controller: _plateNumberController,
                          decoration: InputDecoration(
                            // labelText: 'Plate Number *',
                            hintText: 'MH12AB1234',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter plate number';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Driver Information Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Driver Information',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text("Select Driver *"),
                        const SizedBox(height: 4),
                        DropdownButtonFormField<String>(
                          initialValue: _selectDriverName,
                          decoration: InputDecoration(
                            // labelText: 'Vehicle Type *',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          items: _selectDriver.map((type) {
                            return DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectDriverName = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: EdgeInsets.all(8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue.shade300),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue.shade50,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Current Driver",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Dibyajyoti",
                                style: TextStyle(fontSize: 10),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "+91 98765 43210",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.blue,
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

                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _saveVehicle,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    icon: const Icon(Icons.save, size: 20),

                    label: Text(
                      isEditing ? 'Update Vehicle' : 'Add Vehicle',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveVehicle() {
    if (_formKey.currentState!.validate()) {
      final isEditing = widget.editingVehicle != null;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isEditing
                ? 'Vehicle ${_plateNumberController.text} updated successfully'
                : 'Vehicle ${_plateNumberController.text} added successfully',
          ),
          backgroundColor: AppColors.success,
        ),
      );
      Navigator.pop(context);
    }
  }
}
