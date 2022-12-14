import 'package:flutter/material.dart';
import 'package:my_todo_app/models/category_model.dart';
import 'package:my_todo_app/models/todo_model.dart';

class MyRepository {
  static final MyRepository _instance = MyRepository._();

  factory MyRepository() {
    return _instance;
  }

  MyRepository._();

  static List<CategoryModel> categories = [
    CategoryModel(
      categoryName: "Work",
      categoryColor: Colors.green,
      categoryId: 1,
      iconPath: Icons.work,
    ),
    CategoryModel(
      categoryName: "Sport",
      categoryColor: Colors.blue,
      categoryId: 2,
      iconPath: Icons.sports_basketball,
    ),
    CategoryModel(
      categoryName: "Health",
      categoryColor: Colors.red,
      categoryId: 3,
      iconPath: Icons.favorite_outlined,
    ),
    CategoryModel(
      categoryName: "Food",
      categoryColor: Colors.yellow,
      categoryId: 4,
      iconPath: Icons.fastfood,
    ),
    CategoryModel(
      categoryName: "Coding",
      categoryColor: Colors.black,
      categoryId: 5,
      iconPath: Icons.code,
    )
  ];

  static List<TodoModel> myTodos = [
    TodoModel(
      categoryId: 5,
      dateTime: "2022-07-28 21:50:32.557848",
      isDone: false,
      todoDescription:
      "Learning SQL database requests, Yaxshilab o'rganishim kerak, darsga tayyorlanib borishim shart, Men ikkichi emasman!",
      todoTitle: "SQL",
      urgentLevel: 4,
    ),
    TodoModel(
      categoryId: 1,
      dateTime: "2022-07-26 21:50:32.557848",
      isDone: true,
      todoDescription: "Mettingda qatnashishim kerak",
      todoTitle: "Work",
      urgentLevel: 3,
    )
  ];

  static void addTodoToDone(TodoModel todoModel) {
    for (int i = 0; i < myTodos.length; i++) {
      if (myTodos[i] == todoModel) {
        myTodos[i].isDone = true;
      }
    }
  }

  static void addNewTodo({required TodoModel todoModel}) {
    myTodos.add(todoModel);
  }
}