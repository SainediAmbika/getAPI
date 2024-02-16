import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    void addNewTodo(TextEditingController textEditingController) {
      Get.defaultDialog(
        title: "Enter new task ♥️",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: textController,
                  decoration: InputDecoration(hintText: "Enter task"),
                ))
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Cancel"),
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    print(textController.text);
                    Get.back();
                  },
                  child: Text("SAVE"),
                ),
              ],
            ),
          ],
        ),
      );
    }

    void editTodo(TextEditingController textEditingController) {
      Get.defaultDialog(
        title: "Edit task",
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: textController,
                  decoration: InputDecoration(hintText: "Edit task"),
                ))
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Cancel"),
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    print(textController.text);
                    Get.back();
                  },
                  child: Text("SAVE"),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple[500],
        title: Container(
          child: Text(
            "T O D O",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              addNewTodo(textController);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(color: Colors.deepPurple[500], borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "ADD NEW",
                    style:
                        TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "All Todos",
                  style: TextStyle(fontSize: 18, color: Colors.black45),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[500],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.add_circle,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "Make video on Getx",
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  editTodo(textController);
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                    title: "Delete task",
                                    content: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Do you want to delete"),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            OutlinedButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: Text("NO"),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                print(textController.text);
                                                Get.back();
                                              },
                                              child: Text("YES"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: 4,
            ))
          ],
        ),
      )),
    );
  }
}
