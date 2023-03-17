import 'package:demo/routes/home_route.dart';
import 'package:demo/views/pages/todo/widget/todo_add.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../configs/constants.dart';
import '../models/todo_model.dart';
import '../services/sqlite_helper.dart';
import '../utils/custom_snackbar.dart';
import '../views/components/custom_loader.dart';

class TodoController extends GetxController {
  static TodoController get to => Get.find();
  SqliteHelper sqliteHelper=SqliteHelper.instance;

  var todos = <TodoModel>[];
  var filteredTodo = <TodoModel>[];

  late TextEditingController titleController, descriptionController;
  late FocusNode titleFocusNode, descriptionFocusNode;

  late int editIndex;

  @override
  void onInit() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    titleFocusNode = FocusNode();
    descriptionFocusNode = FocusNode();

    fetchMyTodos();
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    titleFocusNode.unfocus();
    descriptionFocusNode.unfocus();

    super.onClose();
  }

  fetchMyTodos() async {
    // var user = await SharedPrefs().getUser();
    // if (user != null) {
      List<Map<String, dynamic>> data = await sqliteHelper.queryRows();
      try {
        var items =
        data.map<TodoModel>((json) => TodoModel.fromJson(json)).toList();
        todos.assignAll(items);
        filteredTodo.assignAll(items);
        update();
      } catch (e) {
        Exception(e);
      }
    //}
  }

  search(String val) {
    if (val.isEmpty) {
      filteredTodo = todos;
      update();
      return;
    }

    filteredTodo = todos.where((todo) {
      return todo.title!.toLowerCase().contains(val.toLowerCase());
    }).toList();

    update();
  }

  checkTodoAdd() {
    if (titleController.text.isEmpty) {
      customSnackbar(title: 'Error', message: '제목이 비어 있습니다.', backgroundColor: Colors.red.withOpacity(0.5));
      titleFocusNode.requestFocus();
      return;
    } else if (descriptionController.text.isEmpty) {
      customSnackbar(title: 'Error', message: '내용이 비어 있습니다.', backgroundColor: Colors.red.withOpacity(0.5));
      descriptionFocusNode.requestFocus();
      return;
    } else {
      Get.showOverlay(asyncFunction: () => addTodo(), loadingWidget: const CustomLoader());
    }
  }


  addTodo() async {
    //var user = await SharedPrefs().getUser();
    //if (user != null) {
      var uuid = Uuid();
      var now = DateTime.now();
      var result = await sqliteHelper.insertTodo(
          id:uuid.v1().toString(),
          user_id: Constants.userID,
          title: titleController.text,
          description: descriptionController.text,
          date:now.toString());

      if(result > 0) {
        titleController.text = "";
        descriptionController.text = "";
        fetchMyTodos();
        Get.toNamed(HomeRoute.todoPath);
        customSnackbar(title: 'Success',message: '등록 성공',backgroundColor: Colors.green.withOpacity(0.5));

      }else {
        customSnackbar(title: 'Error',message:'등록 실패' ,backgroundColor: Colors.red.withOpacity(0.5));
      }

    // } else {
    //   customSnackbar('Error', '실패', 'error');
    // }
    update();
  }

  editInputBox(int index){
    titleController.text = filteredTodo[index].title!;
    descriptionController.text = filteredTodo[index].description!;
    editIndex=index;
    update();
  }

  emptInputBox(){
    titleController.text = '';
    descriptionController.text = '';

    update();
  }

  checkTodoEdit(String id) {
    if (titleController.text.isEmpty) {
      customSnackbar(title: 'Error', message: '제목이 비어 있습니다.', backgroundColor: Colors.red.withOpacity(0.5));
      titleFocusNode.requestFocus();
      return;
    } else if (descriptionController.text.isEmpty) {
      customSnackbar(title: 'Error', message: '내용이 비어 있습니다.', backgroundColor: Colors.red.withOpacity(0.5));
      descriptionFocusNode.requestFocus();
      return;
    } else {
      Get.showOverlay(asyncFunction: () => editTodo(id), loadingWidget: const CustomLoader());
    }
  }


  editTodo(String id) async {
    //var user = await SharedPrefs().getUser();
    //if (user != null) {
      var result =await sqliteHelper.updateTodo(title: titleController.text, description:descriptionController.text, id:id);
      if(result > 0) {
        titleController.text = "";
        descriptionController.text = "";
        fetchMyTodos();
        Get.toNamed(HomeRoute.todoPath);
        customSnackbar(title: 'Success',message: '수정 성공',backgroundColor: Colors.green.withOpacity(0.5));
      }else {
        customSnackbar(title: 'Error',message:'수정 실패' ,backgroundColor: Colors.red.withOpacity(0.5));
      }

    //}
  }

  deleteTodo(id) async {
    //var user = await SharedPrefs().getUser();
    //if (user != null) {
      var result =await sqliteHelper.deleteTodo(id:id);
      if(result > 0) {
        fetchMyTodos();
        customSnackbar(title: 'Success',message: '삭제 성공',backgroundColor: Colors.green.withOpacity(0.5));
      }else {
        customSnackbar(title: 'Error',message:'삭제 실패' ,backgroundColor: Colors.red.withOpacity(0.5));
      }
    //}
  }


}