import 'package:flutter/material.dart';
import 'package:get/get.dart';

void MyDialogBox() {
  Get.defaultDialog(
      title: "Please enter your name",
      content: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(),
              ),
            ],
          )
        ],
      ),
      titlePadding: EdgeInsets.all(10),
      contentPadding: EdgeInsets.all(10),
      radius: 10,
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            print("done");
            Get.back();
          },
          child: Text("Done"),
        ),
      ],
      backgroundColor: Colors.white);
}
