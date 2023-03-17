import 'package:demo/routes/home_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controllers/todo_controller.dart';
import 'widget/todo_list.dart';
import 'widget/todo_search.dart';


class TodoPage extends StatelessWidget {
  TodoPage({Key? key}) : super(key: key);
  final controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('TODO',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(HomeRoute.todoAddPath);
            },
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal:8, vertical: 8),
              child: SvgPicture.asset('assets/svg/icon-add.svg'),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            //검색
            TodoSearchWidget(controller: controller),
            //목록
            Expanded(child: TodoListWidget(controller: controller))
          ],
        ),
      ),
    );
  }
}



Widget deleteDialog(int index) {
  final controller = Get.find<TodoController>();
  return Center(
    child: Container(
        alignment: Alignment.center,
        width: Get.width * 0.6,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          border: Border.all(
            width: 1.0,
            color: const Color(0xFF707070),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              offset: const Offset(0, 3.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Material(type: MaterialType.transparency, child: Text('TODO를 삭제할까요?',
              style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold),),),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: const Text("예 삭제합니다."),
                    onPressed: () {
                      controller.deleteTodo(controller.filteredTodo[index].id);
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: const Text("아니오"),
                    onPressed: () => Get.back(),
                  ),
                ],
              )
            ],
          ),
        )),
  );
}


