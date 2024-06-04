import 'dart:io';

//import 'package:applicationpef/models/User.dart';
import 'package:applicationpef/models/guide.dart';
import 'package:applicationpef/services/Auth.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_list_pick/support/code_country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:applicationpef/mainscreen.dart';
import 'package:image_picker/image_picker.dart';

final _formKey = GlobalKey<FormState>();
String? _phoneNumberError;
String? _idCardNumberError;

class guideform extends StatefulWidget {
  
  const guideform({Key? key}) : super(key: key);

  @override
  State<guideform> createState() => _guideformState();
}

UserApiCall _userApiCall = UserApiCall();

class _guideformState extends State<guideform> {
  late TextEditingController _firstnamecntrl;
  late TextEditingController _lastnamecntrl;
  late TextEditingController _emailcntrl;
  late TextEditingController _passcntrl;
  late TextEditingController _confirmpasscntrl;
  late TextEditingController _phonecntrl;
  late TextEditingController _idcardcntrl;
  late TextEditingController _imageatscntr;
  late TextEditingController _countryController;
  late TextEditingController _birthdatenctrl;
  bool isObsecured1 = false;
  bool isObsecured2 = false;
  String _selectedCountryName = '';
  @override
  void initState() {
    //fonctionpredefinie
    super.initState();
    _firstnamecntrl = TextEditingController();
    _lastnamecntrl = TextEditingController();
    _emailcntrl = TextEditingController();
    _passcntrl = TextEditingController();
    _confirmpasscntrl = TextEditingController();
    _phonecntrl = TextEditingController();
    _idcardcntrl = TextEditingController();
    _imageatscntr = TextEditingController();
   _countryController = TextEditingController();
    _birthdatenctrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _firstnamecntrl.dispose();
    _lastnamecntrl.dispose();
    _emailcntrl.dispose();
    _passcntrl.dispose();
    _confirmpasscntrl.dispose();
    _phonecntrl.dispose();
    _idcardcntrl.dispose();
    _imageatscntr.dispose();
    _countryController.dispose();
    _birthdatenctrl.dispose();
  }

  late File? _attestationFile;

  Future<void> _pickFile() async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

  setState(() {
    if (pickedFile != null) {
      _attestationFile = File(pickedFile.path);
    } else {
      print('Aucun fichier sélectionné.');
    }
  });
}


  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  "Guide Form!",
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
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _firstnamecntrl,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    prefixIconColor: Colors.black, //countouring
                    hintText: "First name",
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Colors.white),
                    fillColor: const Color(0xFFDECFCF),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    errorText: _phoneNumberError,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter something';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _phoneNumberError = null;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _lastnamecntrl,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    prefixIconColor: Colors.black, //countouring
                    hintText: "Last Name",
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Colors.white),
                    fillColor: const Color(0xFFDECFCF),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    errorText: _phoneNumberError,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter something';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _phoneNumberError = null;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailcntrl,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                    prefixIconColor: Colors.black, //countouring
                    hintText: "email",
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Colors.white),
                    fillColor: const Color(0xFFDECFCF),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    errorText: _phoneNumberError,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter something';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _phoneNumberError = null;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passcntrl,
                  obscureText: !isObsecured1,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                      Icons.lock_open,
                      color: Colors.black,
                    ),
                    prefixIconColor: Colors.black, //countouring
                    hintText: "Password",
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Colors.white),
                    fillColor: const Color(0xFFDECFCF),
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
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    errorText: _phoneNumberError,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter something';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _phoneNumberError = null;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _confirmpasscntrl,
                  obscureText: !isObsecured2,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    prefixIconColor: Colors.black, //countouring
                    hintText: "confirmpassword",
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Colors.white),
                    fillColor: const Color(0xFFDECFCF),
                    filled: true,
                    suffixIcon: IconButton(
                      icon: isObsecured1
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
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    errorText: _phoneNumberError,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter something';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _phoneNumberError = null;
                    });
                  },
                ),
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
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _countryController,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.flag,
                      color: Colors.black,
                    ),
                    prefixIconColor: Colors.black, //countouring
                    hintText: "country",
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Colors.white),
                    fillColor: const Color(0xFFDECFCF),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    errorText: _phoneNumberError,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter something';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _phoneNumberError = null;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              TextFormField(
                    controller: _birthdatenctrl,
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
                      _selectDate();
                    }),
                const SizedBox(
                  height: 20,
                ),
                
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _phonecntrl,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    prefixIconColor: Colors.black, //countouring
                    hintText: "Phone number",
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Colors.white),
                    fillColor: const Color(0xFFDECFCF),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    errorText: _phoneNumberError,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter something';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _phoneNumberError = null;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _idcardcntrl,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.card_membership,
                      color: Colors.black,
                    ),
                    prefixIconColor: Colors.black, //countouring
                    hintText: "ID card Number  ",
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Colors.white),
                    fillColor: const Color(0xFFDECFCF),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    errorText: _idCardNumberError,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter something';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _idCardNumberError = null;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _pickFile,
                  child: Text('Upload Attestation'),
                ),
                const Text(
                  ' "put your certificate validating your experience as a guide"',
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                ElevatedButton(
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      if (_attestationFile != null) {
        _userApiCall.SinupGuide(
          Guide(
            firstName: _firstnamecntrl.text,
            lastName: _lastnamecntrl.text,
            email: _emailcntrl.text,
            password: _passcntrl.text,
            confirmPassword: _confirmpasscntrl.text,
            country: _countryController.text,
            birthdate: DateTime.parse(_birthdatenctrl.text),
            phoneNumber: _phonecntrl.text,
            idCard: _idcardcntrl.text,
            imageAttest: _attestationFile!.path, // Passer le chemin de l'image
          ),
          _attestationFile!, // Passer l'objet File
        );
      } else {
        print('Aucun fichier sélectionné.');
      }
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
  ),
  child: const Text(
    "Sign In",
    style: TextStyle(
      fontSize: 20,
      color: Color.fromARGB(255, 255, 255, 255),
    ),
  ),
),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _birthdatenctrl.text = picked.toString().split(" ")[0];
      });
    }
  }
}
