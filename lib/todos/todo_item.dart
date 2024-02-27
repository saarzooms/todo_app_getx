import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'todo_controller.dart';
import 'todo_model.dart';

class TodoItem extends StatelessWidget {
  Todo item;
  TodoItem(this.item, {super.key});
  //to use controller in this screen
  TodoController controller = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      secondary: SizedBox(
        width: 80,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                controller.editTitle(item.id);
              },
              icon: Icon(
                Icons.edit,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: () {
                controller.deleteTodo(item.id);
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      value: item.isCompleted,
      title: Text(
        item.title,
        style: TextStyle(color: item.isCompleted ? Colors.red : Colors.black),
      ),
      onChanged: (v) {
        controller.changeStatus(item.id);
      },
    );
  }
}
