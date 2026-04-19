import 'package:flutter/material.dart';

void main() {
  runApp(const DoctorCareApp());
}

class DoctorCareApp extends StatelessWidget {
  const DoctorCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DOCTOR CARE',
      theme: ThemeData(
        primaryColor: const Color(0xFF2A5BD7),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        fontFamily: 'Roboto',
      ),
      home: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  DateTime? _selectedDate;
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _creditCardController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  
  bool _acceptTerms = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _creditCardController.dispose();
    _cvvController.dispose();
    _expiryController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              // Header
              _buildHeader(),
              const SizedBox(height: 40),
              
              // Main Content
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 900) {
                    return _buildDesktopLayout();
                  } else {
                    return _buildMobileLayout();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'DOCTOR CARE',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2A5BD7),
            ),
          ),
          Wrap(
            spacing: 24,
            children: [
              _buildNavItem('About Us'),
              _buildNavItem('Member Portal'),
              _buildNavItem('Join Risk Free'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String text) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF555555),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: _buildLeftSection(),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 4,
          child: _buildRightSection(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildLeftSection(),
        const SizedBox(height: 30),
        _buildRightSection(),
      ],
    );
  }

  Widget _buildLeftSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hello\nWorld.',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2A5BD7),
            height: 1.1,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Talk to a physician day or night,\nno matter where you are.',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          'Help your sick child get better, quicker.',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF666666),
          ),
        ),
        const SizedBox(height: 30),
        
        // Highlight Box
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F0FE),
            borderRadius: BorderRadius.circular(8),
            border: const Border(
              left: BorderSide(
                color: Color(0xFF2A5BD7),
                width: 4,
              ),
            ),
          ),
          child: const Text(
            'As a member-consult with a doctor at NO charge.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
            ),
          ),
        ),
        const SizedBox(height: 30),
        
        const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF666666),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF666666),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 30),
        
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF2A5BD7), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'How it works:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Talk to the doctor over the phone, or\nsee the doctor via video chat on a\nmobile device or computer.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF666666),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Feel better already!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2A5BD7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRightSection() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Register',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2A5BD7),
              ),
            ),
          ),
          const SizedBox(height: 25),
          
          Form(
            key: _formKey,
            child: Column(
              children: [
                // Name Row
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        'First Name',
                        controller: _firstNameController,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: _buildTextField(
                        'Last Name',
                        controller: _lastNameController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                
                // Birth Date with Date Picker
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: _buildTextField(
                      'Birth date',
                      controller: TextEditingController(
                        text: _selectedDate != null
                            ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                            : '',
                      ),
                      suffixIcon: const Icon(Icons.calendar_today, size: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                
                // Address
                _buildTextField(
                  'Street Address',
                  controller: _addressController,
                ),
                const SizedBox(height: 15),
                
                // City & State
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        'City',
                        controller: _cityController,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: _buildTextField(
                        'State',
                        controller: _stateController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                
                // Zip Code
                _buildTextField(
                  'Zip Code',
                  controller: _zipCodeController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 15),
                
                // Credit Card
                _buildTextField(
                  'Credit Card #',
                  controller: _creditCardController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 15),
                
                // CVV & Expiry
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        'CCV',
                        controller: _cvvController,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: _buildTextField(
                        'Expiration Date',
                        controller: _expiryController,
                        hintText: 'MM/YY',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Terms and Conditions
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _acceptTerms,
                      onChanged: (value) {
                        setState(() {
                          _acceptTerms = value ?? false;
                        });
                      },
                      activeColor: const Color(0xFF2A5BD7),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF666666),
                          ),
                          children: [
                            TextSpan(text: 'I Accept '),
                            TextSpan(
                              text: 'terms and conditions',
                              style: TextStyle(
                                color: Color(0xFF2A5BD7),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(text: ' & '),
                            TextSpan(
                              text: 'privacy policy',
                              style: TextStyle(
                                color: Color(0xFF2A5BD7),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                
                // Subscribe Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() && _acceptTerms) {
                        _showSuccessDialog();
                      } else if (!_acceptTerms) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please accept terms and conditions'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2A5BD7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'SUBSCRIBE',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Footer
                const Center(
                  child: Text(
                    'AMERICA',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label, {
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    String? hintText,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF555555),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFDDDDDD)),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 12,
              ),
              border: InputBorder.none,
              filled: false,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 10),
            Text('Success!'),
          ],
        ),
        content: const Text('Your registration has been submitted successfully.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}