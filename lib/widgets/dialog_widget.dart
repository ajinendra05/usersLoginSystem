import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../data/boxes.dart';
import '../model/users_details.dart';

class DialogWidget extends StatefulWidget {
  final UserDetails user;
  const DialogWidget({super.key, required this.user});

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String? selectedValue;
  List dropMenuItems = ['Male', 'Female', 'Other'];
  int? age;

  void saveData() {
    FocusScope.of(context).unfocus();
    widget.user.setAge = age!;
    widget.user.setGender = selectedValue!;
    widget.user.setActive();
    final box = Boxes.getUser();
    box.put(
      widget.user.id,
      UserDetails(
          name: widget.user.name,
          id: widget.user.id,
          aType: widget.user.aType,
          age: widget.user.age,
          gender: widget.user.gender,
          isactive: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 250,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (int.tryParse(value!) == null) {
                        return 'please enter valid age';
                      } else if ((int.parse(value) > 100) ||
                          (int.parse(value) < 0)) {
                        return 'please enter valid age';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      hintText: 'Enter Your AGE',
                      hintStyle: const TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    // controller: ageController,
                    onSaved: (newValue) {
                      age = int.parse(newValue!);
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Select Your Gender',
                      style: TextStyle(fontSize: 14),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 30,
                    buttonHeight: 60,
                    buttonPadding: const EdgeInsets.only(left: 10, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    items: dropMenuItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select gender.';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {},
                    onSaved: (value) {
                      selectedValue = value;
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(151, 57, 97, 1)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        saveData();
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Submit'),
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
