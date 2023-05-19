import 'package:flutter/material.dart';
import 'package:infoware/Home/home_screen.dart';
import 'package:infoware/Screens/countries.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final _formKey = GlobalKey<FormState>();
  String? selectedGender;

  TextEditingController _name = TextEditingController();

  TextEditingController _email = TextEditingController();

  TextEditingController _gender = TextEditingController();

  TextEditingController _phone = TextEditingController();
  String? _country;
  TextEditingController _state = TextEditingController();
  TextEditingController _city = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: SweepGradient(
          colors: [Color(0xff171717), Color.fromARGB(255, 7, 0, 78)],
          stops: [0, 1],
          center: Alignment.topLeft,
        )),
        child: Padding(
          padding: EdgeInsets.only(
              left: 25,
              right: 25,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "App\nRegistration",
                  style: TextStyle(
                    fontFamily: "Helvetica",
                    fontSize: 36,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                          controller: _name,
                          style: styleWidget.textStyle(
                              fontsize: 16, color: Colors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ("Name is required");
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: styleWidget.formFieldDesign(
                              'Name', Icons.account_circle)),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _email,
                        style: styleWidget.textStyle(
                            fontsize: 16, color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          final emailRegex =
                              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Invalid email format';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration:
                            styleWidget.formFieldDesign('Email', Icons.email),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _phone,
                        style: styleWidget.textStyle(
                            fontsize: 16, color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone Number is required';
                          }

                          final phoneRegExp = RegExp(r'^[0-9]{10}$');
                          if (!phoneRegExp.hasMatch(value)) {
                            return 'Invalid phone number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration:
                            styleWidget.formFieldDesign('Phone', Icons.phone),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Gender",
                        style: styleWidget.textStyle(
                            fontsize: 16, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white24),
                              child: RadioListTile<String>(
                                contentPadding: const EdgeInsets.only(left: 0),
                                title: Text(
                                  'Male',
                                  style: styleWidget.textStyle(
                                      fontsize: 14, color: Colors.white),
                                ),
                                activeColor: Colors.white,
                                tileColor: Colors.transparent,
                                value: 'male',
                                groupValue: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: 120,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white24),
                              child: RadioListTile<String>(
                                contentPadding: const EdgeInsets.only(left: 0),
                                title: Text(
                                  'Female',
                                  style: styleWidget.textStyle(
                                      fontsize: 14, color: Colors.white),
                                ),
                                value: 'female',
                                groupValue: selectedGender,
                                activeColor: Colors.white,
                                tileColor: Colors.transparent,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white24),
                              child: RadioListTile<String>(
                                contentPadding: const EdgeInsets.only(left: 0),
                                title: Text(
                                  'Other',
                                  style: styleWidget.textStyle(
                                      fontsize: 14, color: Colors.white),
                                ),
                                value: 'other',
                                groupValue: selectedGender,
                                activeColor: Colors.white,
                                tileColor: Colors.transparent,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField(
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 30,
                        menuMaxHeight: 200,
                        dropdownColor: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        hint: Text(
                          'Country',
                          style: styleWidget.textStyle(
                              fontsize: 16, color: Colors.white),
                        ),
                        items: countryNames.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Center(
                              child: Text(
                                value,
                                style: styleWidget.textStyle(
                                    fontsize: 16, color: Colors.white),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _country = newValue.toString();
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return ("Country is required");
                          }
                          return null;
                        },
                        decoration:
                            styleWidget.dropdownDecoration(Icons.public),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _state,
                        style: styleWidget.textStyle(
                            fontsize: 16, color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'State is required';
                          }

                          return null;
                        },
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: styleWidget.formFieldDesign(
                            'State', Icons.home_work),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _city,
                        style: styleWidget.textStyle(
                            fontsize: 16, color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'City is required';
                          }

                          return null;
                        },
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: styleWidget.formFieldDesign(
                            'City', Icons.location_city),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 11, 96, 157)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      icon: Icon(
                                        Icons.check_circle,
                                        size: 30,
                                      ),
                                      title: Text("Registeration Success"),
                                    );
                                  },
                                );
                              }
                            },
                            child: Text(
                              'Submit',
                              style: styleWidget.textStyle(fontsize: 18),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
