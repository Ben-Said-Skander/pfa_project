import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/medicine_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';

import 'package:pfa_application_1/models/medicine.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  MedicineController medicineController = Get.find();
  late Future<Medicine> futureCard;
  final id = Get.arguments as String;

  @override
  void initState() {
    futureCard = medicineController.getMedicine(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 40.0, 0, 20),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              Padding(
                padding: const EdgeInsets.only(left: 108.0),
                child: Center(
                  child: Text(
                    "Details",
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
        FutureBuilder<Medicine>(
            future: futureCard,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MedicineInfo(
                          med_name: "${snapshot.data!.name}",
                          med_dosage: "${snapshot.data!.dosage}",
                          med_pic: "assets/image/${snapshot.data!.type}.jpg"),
                      MidSectionInfo(
                          med_type: "${snapshot.data!.type}",
                          dosage_interval: "${snapshot.data!.interval}",
                          start_time: "${snapshot.data!.start_time}"),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColor.mainColor),
                          child: TextButton(
                              onPressed: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.warning,
                                  headerAnimationLoop: false,
                                  animType: AnimType.topSlide,
                                  showCloseIcon: true,
                                  closeIcon: const Icon(
                                      Icons.close_fullscreen_outlined),
                                  title: 'Warning',
                                  desc:
                                      'Are you sure you want to delete the reminder',
                                  btnCancelOnPress: () {
                                    Get.back();
                                  },
                                  onDismissCallback: (type) {
                                    debugPrint(
                                        'Dialog Dismiss from callback $type');
                                  },
                                  btnOkOnPress: () {
                                    medicineController.deleteMedicine(id);
                                    Get.back(result: true);
                                  },
                                ).show();

                                // Get.offAndToNamed(AppRoute.reminder);
                              },
                              child: Center(
                                  child: Text(
                                "Delete",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                ),
                              ))),
                        ),
                      ),
                    ]);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }))
      ],
    ));
  }
}

class MidSectionInfo extends StatelessWidget {
  const MidSectionInfo(
      {super.key,
      required this.med_type,
      required this.dosage_interval,
      required this.start_time});
  final String med_type;
  final String dosage_interval;
  final String start_time;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
            child: Text(
              "Medicine Type",
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 18,
                fontFamily: "Poppins",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 25),
            child: Text(
              med_type,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Text(
              "Dosage Interval",
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 18,
                fontFamily: "Poppins",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 25),
            child: Text(
              dosage_interval,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Text(
              "Start Time",
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 18,
                fontFamily: "Poppins",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
            child: Text(
              "${start_time}",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      )
    ]);
  }
}

class MedicineInfo extends StatelessWidget {
  const MedicineInfo(
      {super.key,
      required this.med_name,
      required this.med_dosage,
      required this.med_pic});

  final String med_name;
  final String med_dosage;
  final String med_pic;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    spreadRadius: 1,
                    color: Color.fromARGB(255, 207, 207, 207),
                  )
                ]),
            width: 180,
            height: 250,
            margin: EdgeInsets.all(16),
            child: Image.asset(
              med_pic,
              width: 100,
              height: 100,
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                "Medicine Name",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 15,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                med_name,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                "Dosage",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 15,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                med_dosage,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        )
      ],
    );
  }
}
