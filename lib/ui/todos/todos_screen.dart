import 'package:flutter/material.dart';
import 'package:typi_code_sample2/model/todos_model.dart';
import 'package:typi_code_sample2/network/apiservice.dart';
import 'package:typi_code_sample2/ui/todos/todos_list_item.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {

  late Future<List<TodosModel>> list;

  @override
  void initState() {
   list = ApiService().getTodos();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Todos'),
      ),
      floatingActionButton: FloatingActionButton(
           onPressed: (){},
          child:const Icon(Icons.add),
      ),
      body:FutureBuilder(future: list,builder:(context,snapshot){
        return _handleSnapshot(snapshot);
      },),
    );
  }
  Widget _handleSnapshot(AsyncSnapshot<List<TodosModel>> snapshot){
    if(snapshot.hasData){
      return _buildList(snapshot.data ?? []);
    }else if(snapshot.hasError){
      return _buildError(snapshot.error.toString());

    }else{
      return _buildLoading();
    }
  }

  Text _buildError(String error) => Text(error);

  Widget _buildLoading () => const Center(child:CircularProgressIndicator());

  Widget _buildList (List <TodosModel> list){

    if(list.isEmpty) {
      return _buildError('No data');
    }
    return ListView.separated(
        itemCount: list.length > 50 ? 50 : list.length,
        separatorBuilder: (context , i) {
          return const SizedBox(height: 8);
        },
        itemBuilder: (context,index) {
          return TodosListItem(
              todos:list[index]);
        }
    );
  }
}
