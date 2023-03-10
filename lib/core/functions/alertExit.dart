import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pfa_application_1/core/constants/colors.dart';

Future<bool> alertExit() {
  Get.defaultDialog(
      title: " Warning ",
      titleStyle: const TextStyle(
          color: AppColor.mainColor,
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins"),
      middleText: "Are you sure you want to exit the app ",
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColor.mainColor)),
            onPressed: () {
              exit(0);
            },
            child: const Text(
              "Yes",
              style: TextStyle(fontFamily: "Poppins"),
            )),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColor.mainColor)),
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "No",
              style: TextStyle(fontFamily: "Poppins"),
            ))
      ]);
  return Future.value(true);
}
