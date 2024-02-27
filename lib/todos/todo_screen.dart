import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/todos/todo_model.dart';
import 'todo_controller.dart';
import 'todo_item.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});
  //to use controller in this screen
  TodoController controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Todo App')),
        body: Column(
          children: [
            //to add todo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: controller.txtTitleCnt,
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter todo title',
                  suffix: IconButton(
                    onPressed: () {
                      controller.addItem();
                    },
                    icon: Icon(Icons.add),
                  ),
                ),
              ),
            ),
            //to display todos
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) {
                    Todo item = controller.items[index];
                    return TodoItem(item);
                  },
                ),
              ),
            )
          ],
        ));
  }
}
