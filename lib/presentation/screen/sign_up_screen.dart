import 'package:flutter/material.dart';
import 'package:sanggar_budaya/presentation/screen/login_screen.dart';
import 'package:sanggar_budaya/presentation/viewmodel/sign_up_screen_viewmodel.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _viewmodel = SignUpScreenViewModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _birthDateController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  DateTime? _selectedDate;
  String? _selectedGender;
  String? _selectedCountry;

  @override
  void dispose() {
    _scrollController.dispose();
    _birthDateController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          ),
          title: const Text(
            'Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => _viewmodel.validator(value, 'Name'),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Flexible(
                        flex: 2,
                        child: TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            labelText: '+62',
                            border: const OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 8,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: 'Phone no.',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) =>
                              _viewmodel.validator(value, 'Phone no.'),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => _viewmodel.validator(value, 'Email'),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Flexible(
                        flex: 5,
                        child: TextFormField(
                          controller: _birthDateController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Birth Date',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_month),
                          ),
                          validator: (value) =>
                              _viewmodel.validator(value, 'Birth Date'),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                _selectedDate = pickedDate;
                                _birthDateController.text =
                                    '${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}';
                              });
                            }
                          },
                        ),
                      ),
                      Flexible(
                        flex: 5,
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            labelText: 'Gender',
                            border: OutlineInputBorder(),
                          ),
                          items: ['Male', 'Female']
                              .map((gender) => DropdownMenuItem(
                                    value: gender,
                                    child: Text(gender),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                          validator: (value) =>
                              value == null ? 'Please select a gender' : null,
                        ),
                      ),
                    ],
                  ),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      labelText: 'Country',
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      'Indonesia',
                      'Germany',
                      'United States',
                      'Japan',
                      'China'
                    ]
                        .map((country) => DropdownMenuItem(
                              value: country,
                              child: Text(country),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCountry = value;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Please select a country' : null,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        _viewmodel.validator(value, 'Address'),
                  ),
                  TextFormField(
                    focusNode: _passwordFocusNode,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        _viewmodel.validator(value, 'password'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Please fill in all the required fields.'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(double.maxFinite, 50),
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
