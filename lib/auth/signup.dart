import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:applicationpef/services/Auth.dart';
import 'package:applicationpef/models/User.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _birthdateController = TextEditingController();
  bool isObsecured1 = false;
  bool isObsecured2 = false;
  String _selectedCountryName = '';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Sign Up!",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        color: Colors.grey,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.black),
                    hintText: "First Name",
                    filled: true,
                    fillColor: Color(0xFFDECFCF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.black),
                    hintText: "Last Name",
                    filled: true,
                    fillColor: Color(0xFFDECFCF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail, color: Colors.black),
                    hintText: "Email",
                    filled: true,
                    fillColor: Color(0xFFDECFCF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Add email validation logic if needed
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !isObsecured1,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.black),
                    hintText: "Password",
                    filled: true,
                    suffixIcon: IconButton(
                      icon: isObsecured1
                          ? const Icon(CupertinoIcons.eye)
                          : const Icon(CupertinoIcons.eye_slash),
                      color: Colors.black,
                      onPressed: () {
                        setState(() {
                          isObsecured1 = !isObsecured1;
                          print(isObsecured1);
                        });
                      },
                      splashRadius: 15,
                    ),
                    fillColor: Color(0xFFDECFCF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    // Add password validation logic if needed
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPasswordController,
                   obscureText: isObsecured2,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.black),
                    hintText: "Confirm Password",
                    filled: true,
                    suffixIcon: IconButton(
                      icon: !isObsecured1
                          ? const Icon(CupertinoIcons.eye)
                          : const Icon(CupertinoIcons.eye_slash),
                      color: Colors.black,
                      onPressed: () {
                        setState(() {
                          isObsecured2 = !isObsecured2;
                          print(isObsecured1);
                        });
                      },
                      splashRadius: 15,
                    ),
                    fillColor: Color(0xFFDECFCF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                    controller: _birthdateController,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.date_range,
                        color: Colors.black,
                      ),
                      prefixIconColor: Colors.black, //countouring
                      hintText: "BirthDate",
                      hintStyle:
                          const TextStyle(fontSize: 14, color: Colors.white),
                      fillColor: const Color(0xFFDECFCF),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'enter your BirthDate';
                      }
                      return null;
                    },
                    onTap: () {
                      _selectDate(context);
                    }),
                const SizedBox(height: 20),
                CountryListPick(
                  theme: CountryTheme(
                    isShowFlag: true,
                    isShowTitle: true,
                    isShowCode: false,
                    isDownIcon: true,
                    showEnglishName: true,
                  ),
                  initialSelection: '+1',
                  onChanged: (CountryCode? code) {
                    if (code != null) {
                      setState(() {
                        _selectedCountryName = code.name ?? '';
                        _countryController.text = _selectedCountryName;
                      });
                    }
                  },
                  useUiOverlay: true,
                  useSafeArea: false,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _countryController,
                  readOnly: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.flag, color: Colors.black),
                    hintText: "Country",
                    filled: true,
                    fillColor: Color(0xFFDECFCF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your country';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, create User object and call API
                      User user = User(
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        confirmPassword: _confirmPasswordController.text,
                        country: _countryController.text,
                        birthdate: DateTime.parse(_birthdateController.text),
                      );

                      // Call API to register user
                      UserApiCall().postUser(user, context);
                    }
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _birthdateController.text =
            "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
      });
    }
  }
}
