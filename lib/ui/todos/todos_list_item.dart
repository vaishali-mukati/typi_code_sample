import 'package:flutter/material.dart';
import 'package:typi_code_sample2/model/todos_model.dart';

class TodosListItem extends StatefulWidget {
  const TodosListItem({super.key,required this.todos});

  final TodosModel todos;

  @override
  State<TodosListItem> createState() => _TodosListItemState();
}

class _TodosListItemState extends State<TodosListItem> {



  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
       child: Text(widget.todos.id.toString(),

       ),
       ),
      title: Text(widget.todos.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,),
        trailing:widget.todos.completed ?const SizedBox.shrink()
        :Checkbox(
              value:widget.todos.completed,
              onChanged:(value){})
        );

     }

}



