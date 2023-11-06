import 'package:flutter/material.dart';
import 'package:typi_code_sample2/model/todos_model.dart';
import 'package:typi_code_sample2/ui/todos/todos_detail_screen.dart';

class TodosListItem extends StatelessWidget {
  const TodosListItem({super.key,required this.todos});

  final TodosModel todos;

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: (){
         Navigator.of(context).push(
             MaterialPageRoute(
                 builder: (ctx) => TodosDetailScreen(todos: todos)));
       },
      child: ListTile(
        leading: CircleAvatar(
          child: Text(todos.id.toString()),
        ),
        title: Text(todos.title,
                maxLines: 1,
               overflow: TextOverflow.ellipsis,),
        subtitle:Text(
            todos.completed.toString(),
           ),
      ),
    );
  }
}
