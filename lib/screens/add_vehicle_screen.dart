import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_header.dart';
import '../models/vehicle.dart';

class AddVehicleScreen extends StatefulWidget {
  final Vehicle? editingVehicle;

  const AddVehicleScreen({
    Key? key,
    this.editingVehicle,
  }) : super(key: key);

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
      text: widget.editingVehicle?.driver ?? '',
    );
    _phoneController = TextEditingController(
      text: widget.editingVehicle?.driverPhone ?? '',
    );
    _vehicleType = widget.editingVehicle?.type ?? 'Car';
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
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton.icon(
              onPressed: _saveVehicle,
              icon: const Icon(Icons.save, size: 16),
              label: const Text('Save'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                textStyle: const TextStyle(fontSize: 14),
              ),
            ),
          ),
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
                          value: _vehicleType,
                          decoration: InputDecoration(
                            // labelText: 'Vehicle Type *',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          items: _vehicleTypes.map((type) {
                            return DropdownMenuItem(
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
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text("Make *"),
                        const SizedBox(height: 4),
                                  TextFormField(
                                    controller: _makeController,
                                    decoration: InputDecoration(
                                      // labelText: 'Make *',
                                      hintText: 'Tata',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter make';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text("Model *"),
                        const SizedBox(height: 4),
                                  TextFormField(
                                    controller: _modelController,
                                    decoration: InputDecoration(
                                      // labelText: 'Model *',
                                      hintText: 'LPT 1613',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter model';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                          Text("Year *"),
                        const SizedBox(height: 4),
                        TextFormField(
                          controller: _yearController,
                          decoration: InputDecoration(
                            // labelText: 'Year *',
                            hintText: '2022',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter year';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                          Text("Plate Number *"),
                        const SizedBox(height: 4),
                        TextFormField(
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
                          Text("Driver Name *"),
                        const SizedBox(height: 4),
                        TextFormField(
                          controller: _driverController,
                          decoration: InputDecoration(
                            // labelText: 'Driver Name *',
                            hintText: 'Raj Sharma',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter driver name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                          Text("Driver Phone *"),
                        const SizedBox(height: 4),
                        TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            // labelText: 'Driver Phone *',
                            hintText: '+91 98765 43210',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter phone number';
                            }
                            return null;
                          },
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
