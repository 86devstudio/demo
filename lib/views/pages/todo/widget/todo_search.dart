import 'package:flutter/material.dart';

import '../../../../controllers/todo_controller.dart';
import '../../../components/custom_search.dart';

class TodoSearchWidget extends StatelessWidget {
  const TodoSearchWidget({
    super.key,
    required this.controller,
  });

  final TodoController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: CustomSearch(onChanged: (val) {
        controller.search(val);
      },color: Colors.grey,),
    );
  }
}