// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/medicine_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMedicine extends StatefulWidget {
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  int bottleIndex = 0;
  int pillsIndex = 0;
  int syringeIndex = 0;

  int typeIndex = 1;

  Color bottleColor = Colors.grey;
  Color pillsColor = Colors.grey;
  Color syringeColor = Colors.grey;
  MedicineController medicineController = Get.find();

  late TextEditingController med_nameController;
  late TextEditingController med_dosageController;
  late TextEditingController starting_timeController;
  final _formKey = GlobalKey<FormState>();
  String dropdownvalue = "Every 2 hours";
  var intervals = [
    "Every 1 hour",
    "Every 2 hours",
    "Every 4 hours",
    "Every 6 hours",
    "Every 8 hours",
    "Every 12 hours",
    "Every 24 hours",
    "Not repeated"
  ];
  late String? userId;
  int selectedIndex = 0;
  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = await prefs.getString('userID');
    print("****************************************");
    print(userId);
    print("****************************************");
    return userId;
  }

  @override
  void dispose() {
    med_nameController.dispose();
    med_dosageController.dispose();
    starting_timeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    med_nameController = TextEditingController();
    med_dosageController = TextEditingController();
    starting_timeController = TextEditingController();
    getUserId().then((value) {
      setState(() {
        userId = value;
      });
    });
    super.initState();
  }

  String chooseType(int index) {
    if (index == 1) {
      return "Bottle";
    } else if (index == 2) {
      return "Pills";
    } else {
      return "Syringe";
    }
  }

  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 18.0, 0, 28),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              Padding(
                padding: const EdgeInsets.only(left: 80.0),
                child: Center(
                  child: Text(
                    "Add New Medicine",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Titles(title: "Medicine name"),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          width: 350,
          child: TextFormField(
            maxLength: 16,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter Something";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.secondryColor)),
                hintText: "Medicine name",
                prefixIcon: Icon(FontAwesomeIcons.pills)),
            controller: med_nameController,
            cursorColor: Color.fromARGB(255, 16, 152, 170),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: Titles(title: "Dosage"),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          width: 350,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter Something";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.secondryColor)),
              hintText: "Dosage",
              prefixIcon: Icon(FontAwesomeIcons.hashtag),
            ),
            controller: med_dosageController,
            cursorColor: Color.fromARGB(255, 16, 152, 170),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(30, 40, 20, 0),
            child: Text("Medicine Type",
                style: TextStyle(
                    color: AppColor.mainColor,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600))),

        /****************************************** */
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.bottleDroplet,
                    ),
                    iconSize: 70,
                    onPressed: () {
                      setState(() {
                        // To test what type of medicine it is
                        typeIndex = 1;
                        print(typeIndex);
                        /************** */
                        bottleIndex = 1;
                        pillsIndex = 0;
                        syringeIndex = 0;
                      });
                      if (bottleIndex == 1) {
                        bottleColor = Color.fromARGB(255, 4, 107, 120);
                        pillsColor = Colors.grey;
                        syringeColor = Colors.grey;
                      }
                    },
                    color: bottleColor,
                  ),
                  Text("Bottle")
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        // To test what type of medicine it is
                        typeIndex = 2;
                        print(typeIndex);
                        /************** */
                        pillsIndex = 1;
                        bottleIndex = 0;
                        syringeIndex = 0;
                      });
                      if (pillsIndex == 1) {
                        pillsColor = Color.fromARGB(255, 4, 107, 120);
                        syringeColor = Colors.grey;
                        bottleColor = Colors.grey;
                      }
                    },
                    icon: Icon(FontAwesomeIcons.pills, color: pillsColor),
                    iconSize: 70,
                  ),
                  Text("Pills")
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        // To test what type of medicine it is
                        typeIndex = 3;
                        print(typeIndex);
                        /************** */
                        syringeIndex = 1;
                        pillsIndex = 0;
                        bottleIndex = 0;
                      });
                      if (syringeIndex == 1) {
                        syringeColor = Color.fromARGB(255, 4, 107, 120);
                        bottleColor = Colors.grey;
                        pillsColor = Colors.grey;
                      }
                    },
                    icon: Icon(FontAwesomeIcons.syringe, color: syringeColor),
                    iconSize: 70,
                  ),
                  Text("Syringe")
                ],
              ),
            ],
          ),
        ),
        //MedicineType(),
        /************************************************ */
        Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Row(
            children: [
              Text("Remind me every",
                  style: TextStyle(
                      color: AppColor.mainColor,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600)),
              SizedBox(
                width: 20,
              ),
              DropdownButton(
                  iconEnabledColor: AppColor.mainColor,
                  hint: Text("Select Interval"),
                  elevation: 4,
                  value: dropdownvalue, // initial value
                  items: intervals.map((String items) {
                    return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: TextStyle(fontFamily: "Poppins"),
                        ));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  })
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 13, 0, 0),
          child: Row(
            children: [
              Text(
                "Starting Time",
                style: TextStyle(
                    color: AppColor.mainColor,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: 200,
                child: TextFormField(
                  maxLength: 20,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Something";
                    } else {
                      return null;
                    }
                  },
                  controller: starting_timeController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColor.secondryColor)),
                      hintText: "16:05"),
                  cursorColor: Color.fromARGB(255, 16, 152, 170),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColor.mainColor),
            child: TextButton(
                onPressed: () {
                  final form = _formKey.currentState;
                  if (form != null && form.validate()) {
                    medicineController.addMedicine(
                        med_nameController.text,
                        med_dosageController.text,
                        chooseType(typeIndex),
                        dropdownvalue,
                        starting_timeController.text,
                        userId!);

                    Get.back();
                  }
                },
                child: Center(
                    child: Text(
                  "Confirm",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                ))),
          ),
        ),
      ]),
    ));
  }
}

class Titles extends StatelessWidget {
  const Titles({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
      child: Container(
        child: Text(
          title,
          style: TextStyle(
              color: AppColor.mainColor,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
