import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../controllers/todo_controller.dart';
import '../../../../routes/home_route.dart';
import '../todo_page.dart';
import 'todo_view.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({
    super.key,
    required this.controller,
  });

  final TodoController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(builder: (logic) {
      return ListView.builder(
          itemCount: logic.filteredTodo.length,
          itemBuilder: (context, index) {
            var todo=logic.filteredTodo[index];
          return Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Card(
              elevation: 1.5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(TodoView(
                          index: index,
                          controller: logic,
                        ));
                      },
                      child: Text('${todo.title}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold),),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        controller.editInputBox(index);
                        Get.toNamed(HomeRoute.todoEditPath);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                        child: SvgPicture.asset('assets/svg/icon-edit.svg'),
                      ),
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () {
                        Get.dialog(deleteDialog(index));
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                        child: SvgPicture.asset('assets/svg/icon-trash.svg'),
                      ),
                    ),
                    SizedBox(width: 5,),
                  ],
                ),
              ),
            ),
          );
        }
      );
    });
  }
}