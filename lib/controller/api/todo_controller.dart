import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getxapi/model/todoModel.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class TodoController extends GetxController {
  var TodoList = RxList<TodoModel>();
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  Future<RxList<TodoModel>> getData() async {
    final response = await http.get(Uri.parse("https://65cde7cec715428e8b3f6b83.mockapi.io/api/todolist"));
    var data = jsonDecode(response.body.toString());
    print("data $data");
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        TodoList.add(TodoModel.fromJson(index));
        print("TodoList $TodoList");
      }
      return TodoList;
    } else {
      return TodoList;
    }
  }
}
