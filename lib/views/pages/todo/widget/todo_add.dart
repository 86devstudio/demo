import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../controllers/todo_controller.dart';
import '../../../components/custom_multi_textfield.dart';
import '../../../components/custom_single_textfield.dart';

class TodoAdd extends StatelessWidget {
  TodoAdd({Key? key}) : super(key: key);
  final controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'TODO ADD',
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        controller.emptInputBox();
                        Get.back();
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                        child: SvgPicture.asset('assets/svg/icon-close.svg'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomSingleTextField(
                        hint: '제목',
                        controller: controller.titleController,
                        prefixIcon: Icon(Icons.title_rounded),
                        focusNode: controller.titleFocusNode,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMultiTextField(
                  controller: controller.descriptionController,
                  hint: '내용',
                  focusNode: controller.descriptionFocusNode,
                  color: Colors.grey,
                  maxLines: 10,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.checkTodoAdd();
                    },
                    child: Container(
                      width: 140,
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 20, height: 20, child: SvgPicture.asset('assets/svg/icon-add.svg')),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '추 가',
                            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
