import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_header.dart';
import '../models/driver.dart';

class AddDriverScreen extends StatefulWidget {
  final Driver? editingDriver;

  const AddDriverScreen({super.key, this.editingDriver});

  @override
  State<AddDriverScreen> createState() => _AddDriverScreenState();
}

class _AddDriverScreenState extends State<AddDriverScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _licenseController;
  late TextEditingController _licenseExpiryController;
  late TextEditingController _vehicleController;
  late String _status;

  final List<String> _statusOptions = ['Active', 'Inactive', 'On Leave'];

  @override
  void initState() {
    super.initState();
    // Initialize controllers with editing data if available
    _nameController = TextEditingController(
      text: widget.editingDriver?.name ?? '',
    );
    _emailController = TextEditingController(
      text: widget.editingDriver?.email ?? '',
    );
    _phoneController = TextEditingController(
      text: widget.editingDriver?.phone ?? '',
    );
    _licenseController = TextEditingController(
      text: widget.editingDriver?.licenseNumber ?? '',
    );
    _licenseExpiryController = TextEditingController(
      text: widget.editingDriver?.licenseExpiry.toString() ?? '',
    );
    _vehicleController = TextEditingController(
      text: widget.editingDriver?.currentVehicleName ?? '',
    );
    _status = widget.editingDriver?.status.toString() ?? 'Active';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _licenseController.dispose();
    _licenseExpiryController.dispose();
    _vehicleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.editingDriver != null;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: MobileHeader(
        title: isEditing ? 'Edit Driver' : 'Add Driver',
        subtitle: isEditing
            ? 'Update ${widget.editingDriver!.name}'
            : 'Enter driver details',
        canGoBack: true,
        action: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 8.0),
          //   child: ElevatedButton.icon(
          //     onPressed: _saveDriver,
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
                // Personal Information Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Personal Information',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text("Full Name *"),
                        const SizedBox(height: 4),
                        TextFormField(
                          readOnly: true,
                          controller: _nameController,
                          decoration: InputDecoration(
                            // labelText: 'Enter Name *',
                            hintText: 'Enter Name',
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
                        Text("Phone Number *"),
                        const SizedBox(height: 4),
                        TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            hintText: 'Phone Number *',
                            // hintText: '+91 98765 43210',
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

                const SizedBox(height: 16),

                // License Information Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'License Information',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text("Licence Number *"),
                        const SizedBox(height: 4),
                        TextFormField(
                          readOnly: true,
                          controller: _licenseController,
                          decoration: InputDecoration(
                            hintText: 'License Number *',
                            // hintText: 'MH1420110012345',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter license number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Assignment Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Assignment',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text("Assigned Vehicle *"),
                        const SizedBox(height: 4),
                        TextFormField(
                          readOnly: true,
                          controller: _vehicleController,
                          decoration: InputDecoration(
                            // labelText: 'Assigned Vehicle',
                            hintText: 'MH12AB1234',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text("Status *"),
                        const SizedBox(height: 4),
                        DropdownButtonFormField<String>(
                          initialValue: _status,
                          decoration: InputDecoration(
                            hintText: 'Status *',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          items: _statusOptions.map((status) {
                            return DropdownMenuItem(
                              enabled: false,
                              value: status,
                              child: Text(status),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _status = value!;
                            });
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
                  child: ElevatedButton(
                    onPressed: _saveDriver,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      isEditing ? 'Update Driver' : 'Add Driver',
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

  void _saveDriver() {
    if (_formKey.currentState!.validate()) {
      final isEditing = widget.editingDriver != null;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isEditing
                ? 'Driver ${_nameController.text} updated successfully'
                : 'Driver ${_nameController.text} added successfully',
          ),
          backgroundColor: AppColors.success,
        ),
      );
      Navigator.pop(context);
    }
  }
}
