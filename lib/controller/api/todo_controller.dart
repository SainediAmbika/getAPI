import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getxapi/model/todoModel.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class TodoController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  var todoList = RxList<TodoModel>();
  RxBool isLoaded = false.obs;
  //Get Method
  Future<RxList<TodoModel>> getData() async {
    isLoaded.value = true;
    final response = await http.get(Uri.parse("https://65cde7cec715428e8b3f6b83.mockapi.io/api/todolist"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      // When a client receives a 200 status code, it means that the request was processed successfully, and the server is returning the requested information.
      for (Map<String, dynamic> index in data) {
        todoList.add(TodoModel.fromJson(index));
      }
      isLoaded.value = false;
      return todoList;
    } else {
      return todoList;
    }
  }

  //Post Method
  Future<void> postData(title) async {
    isLoaded.value = true;
    final response = await http.post(
      Uri.parse("https://65cde7cec715428e8b3f6b83.mockapi.io/api/todolist"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {'title': title},
      ),
    );

    if (response.statusCode == 201) {
      //When a client receives a 201 status code, it means that the request was successful, and a new resource has been created on the server.
      todoList.clear();
      getData();
      isLoaded.value = false;
    } else {}
  }

  //Delete Method
  Future<void> deleteData(id) async {
    isLoaded.value = true;
    final response = await http.delete(
      Uri.parse(
          "https://65cde7cec715428e8b3f6b83.mockapi.io/api/todolist/$id"), //Must specify need to delete item in the url
    );

    if (response.statusCode == 200) {
      todoList.clear();
      getData();
      isLoaded.value = false;
    } else {}
  }
}
