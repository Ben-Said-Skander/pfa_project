// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, camel_case_types, avoid_unnecessary_containers

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/view/widgets/curve_clipper.dart';
import 'package:pfa_application_1/view/widgets/wave_clipper.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  late TextEditingController searchController;

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    searchController = TextEditingController();

    super.initState();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   backgroundColor: Colors.white,
      body: ListView(children: [
        /*
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios)),*/

        Stack(
          children: [
            Image.asset(
              "assets/image/doliprane.jpg",
              //     height: 400,
            ),
            /*  Positioned(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back_ios)))),*/
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 190, 0, 0),
              child: Container(
                height: 622,
                width: double.infinity,
                //   height: 800,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 240, 240, 240),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22, 10, 0, 10),
                        child: Text("Blog Title",
                            style: TextStyle(
                                color: AppColor.mainColor,
                                fontFamily: "Poppins",
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 40),
                        child: Text("Blog body is here",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                      )
                    ]),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
