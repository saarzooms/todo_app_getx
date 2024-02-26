import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'todo_model.dart';

class TodoController extends GetxController {
  RxList<Todo> items = RxList.empty();
  TextEditingController txtTitleCnt = TextEditingController();

  addItem() {
    if (txtTitleCnt.text.isNotEmpty) {
      log(DateTime.now().toIso8601String());
      items
          .add(Todo(DateTime.now().toIso8601String(), txtTitleCnt.text, false));
      txtTitleCnt.clear();
    }
  }

  changeStatus(String id) {
    items.value = items
        .map((item) =>
            item.id == id ? Todo(item.id, item.title, !item.isCompleted) : item)
        .toList();
  }

  editTitle(String id) {
    txtTitleCnt.text = items.firstWhere((element) => element.id == id).title;
  }
}
