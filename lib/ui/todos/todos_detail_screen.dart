import 'package:flutter/material.dart';
import 'package:typi_code_sample2/model/todos_model.dart';
class TodosDetailScreen extends StatefulWidget {
  const TodosDetailScreen({super.key,required this.todos});

  final TodosModel todos;

  @override
  State<TodosDetailScreen> createState() => _TodosDetailScreenState();
}

class _TodosDetailScreenState extends State<TodosDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('userId: ${widget.todos.userId}'),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child:Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.star,
              size: 36,
            ),
            const SizedBox(
                width: 16
            ),
            Flexible(
              child:Column(
                children:[
                  Text(
                    widget.todos.title,
                    style:const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                 // const SizedBox(
                   //   height: 16),

                     // Text(
                       //   widget.todos.completed.toString(),
                      //),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
