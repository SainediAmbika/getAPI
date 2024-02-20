import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/api/todo_controller.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    TextEditingController editController = TextEditingController();
    TodoController todoCntrl = Get.put(TodoController());
    bool isEdited = false;
    void MyBottomSheet() {
      Get.bottomSheet(Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(color: Colors.white),
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(hintText: "Enter a task"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                    textController.clear();
                  },
                  child: Text("CANCEL"),
                ),
                ElevatedButton(
                  onPressed: () {
                    todoCntrl.postData(textController.text.toString());
                    Get.back();
                    textController.clear();
                  },
                  child: Text("SAVE"),
                ),
              ],
            ),
          ],
        ),
      ));
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "T O D O",
              style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            // Container(
            //   padding: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: Colors.blue,
            //   ),
            //   child: Icon(
            //     Icons.add,
            //     size: 35,
            //   ),
            // ),
            SizedBox(
              height: 550,
              child: SingleChildScrollView(
                child: Obx(
                  () => todoCntrl.isLoaded.value
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          children: todoCntrl.todoList
                              .map(
                                (e) => InkWell(
                                  onTap: () {
                                    MyBottomSheet();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    decoration:
                                        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: RichText(
                                            text: TextSpan(
                                              text: e.title.toString(),
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                    child: IconButton(
                                                  onPressed: () {
                                                    editController.text = e.title
                                                        .toString(); // Populate the dialog with the current title
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return AlertDialog(
                                                          title: Text('Edit Task'),
                                                          content: TextFormField(
                                                            controller: editController,
                                                            decoration: InputDecoration(hintText: 'Enter new title'),
                                                          ),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                              child: Text('CANCEL'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () {
                                                                todoCntrl.putData(e.id, editController.text);
                                                                Get.back();
                                                              },
                                                              child: Text('SAVE'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },

                                                  // onPressed: () {
                                                  //   todoCntrl.putData(e.id, e.title.toString());
                                                  // },
                                                  icon: Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                    child: IconButton(
                                                  onPressed: () {
                                                    todoCntrl.deleteData(e.id);
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // Scaffold(
    //   appBar: AppBar(
    //     centerTitle: true,
    //     backgroundColor: Colors.deepPurple[500],
    //     title: Container(
    //       child: Text(
    //         "T O D O",
    //         style: TextStyle(
    //           color: Colors.white,
    //         ),
    //       ),
    //     ),
    //   ),
    //   // bottomNavigationBar: Row(
    //   //   mainAxisAlignment: MainAxisAlignment.center,
    //   //   children: [
    //   //     InkWell(
    //   //       onTap: () {
    //   //         addNewTodo(textController);
    //   //       },
    //   //       child: Container(
    //   //         margin: EdgeInsets.all(10),
    //   //         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    //   //         decoration: BoxDecoration(color: Colors.deepPurple[500], borderRadius: BorderRadius.circular(10)),
    //   //         child: Row(
    //   //           children: [
    //   //             Icon(
    //   //               Icons.add,
    //   //               size: 30,
    //   //               color: Colors.white,
    //   //             ),
    //   //             SizedBox(
    //   //               width: 30,
    //   //             ),
    //   //             Text(
    //   //               "ADD NEW",
    //   //               style:
    //   //                   TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5),
    //   //             ),
    //   //           ],
    //   //         ),
    //   //       ),
    //   //     ),
    //   //   ],
    //   // ),
    //   body: SafeArea(
    //       child: Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child: Column(
    //       children: [
    //         Row(
    //           children: [
    //             Text(
    //               "All Todos",
    //               style: TextStyle(fontSize: 18, color: Colors.black45),
    //             ),
    //           ],
    //         ),
    //         Expanded(
    //             child: ListView.builder(
    //           itemBuilder: (context, index) {
    //             return Obx(() => Column(
    //                   children: todoCntrl.todoList
    //                       .map(
    //                         (e) => Container(
    //                           decoration: BoxDecoration(
    //                             color: Colors.deepPurple[500],
    //                             borderRadius: BorderRadius.circular(10),
    //                           ),
    //                           padding: EdgeInsets.all(10),
    //                           margin: EdgeInsets.all(10),
    //                           child: Column(
    //                             children: [
    //                               Row(
    //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                                 children: [
    //                                   Row(
    //                                     children: [
    //                                       IconButton(
    //                                         onPressed: () {
    //                                           addNewTodo(textController);
    //                                         },
    //                                         icon: Icon(
    //                                           Icons.add_circle,
    //                                           color: Colors.white,
    //                                           size: 30,
    //                                         ),
    //                                       ),
    //                                       SizedBox(
    //                                         width: 30,
    //                                       ),
    //                                       Text(
    //                                         e.title.toString(),
    //                                         style: TextStyle(fontSize: 20, color: Colors.white),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                   Row(
    //                                     children: [
    //                                       IconButton(
    //                                         onPressed: () {
    //                                           editTodo(textController);
    //                                         },
    //                                         icon: Icon(
    //                                           Icons.edit,
    //                                           color: Colors.white,
    //                                           size: 30,
    //                                         ),
    //                                       ),
    //                                       IconButton(
    //                                         onPressed: () {
    //                                           Get.defaultDialog(
    //                                             title: "Delete task",
    //                                             content: Column(
    //                                               crossAxisAlignment: CrossAxisAlignment.center,
    //                                               children: [
    //                                                 Row(
    //                                                   children: [
    //                                                     Text("Do you want to delete"),
    //                                                   ],
    //                                                 ),
    //                                                 SizedBox(
    //                                                   width: 30,
    //                                                 ),
    //                                                 Row(
    //                                                   mainAxisAlignment: MainAxisAlignment.center,
    //                                                   children: [
    //                                                     OutlinedButton(
    //                                                       onPressed: () {
    //                                                         Get.back();
    //                                                       },
    //                                                       child: Text("NO"),
    //                                                     ),
    //                                                     SizedBox(
    //                                                       width: 30,
    //                                                     ),
    //                                                     ElevatedButton(
    //                                                       onPressed: () {
    //                                                         print(textController.text);
    //                                                         Get.back();
    //                                                       },
    //                                                       child: Text("YES"),
    //                                                     ),
    //                                                   ],
    //                                                 ),
    //                                               ],
    //                                             ),
    //                                           );
    //                                         },
    //                                         icon: Icon(
    //                                           Icons.delete,
    //                                           color: Colors.white,
    //                                           size: 30,
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   )
    //                                 ],
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       )
    //                       .toList(),
    //                 ));
    //           },
    //           itemCount: 4,
    //         ))
    //       ],
    //     ),
    //   )),
    // );
  }
}
