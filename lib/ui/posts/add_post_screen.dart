import 'package:flutter/material.dart';
import 'package:typi_code_sample2/model/posts_model.dart';
import 'package:typi_code_sample2/network/apiservice.dart';
class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  ValueNotifier<bool> loading = ValueNotifier((false));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Column(
            children: [
              TextField(
                maxLength: 36,
                decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder()),
                controller: titleController,
              ),
              const SizedBox(height: 16),
              TextField(
                maxLines: 10,
                decoration: const InputDecoration(
                    labelText: 'body',
                    border: OutlineInputBorder()),
                controller: bodyController,
              ),
              const SizedBox(height: 16,),
              SizedBox(
                width: double.infinity,
                child: ValueListenableBuilder<bool>(
                  valueListenable: loading,
                  builder: (context, value, child) {
                    return ElevatedButton(
                      onPressed: value ? null : () {
                        submit();
                      },
                      child:
                      value ?
                      const Center(child: CircularProgressIndicator(),) :
                      const Text('Submit'),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void submit() {
    String empty = ' ';
    if (titleController.text.isEmpty) {
      empty = 'Title';
    }
    if (bodyController.text.isEmpty) {
      empty = empty.isEmpty ? 'body' : '$empty and body';
    }
    if (empty.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('$empty can not be empty')));
    }
    loading.value = true;
    ApiService().addPost(
        PostsModel(
        userId: 1,
        id: 1,
        title: titleController.text,
        body: bodyController.text)).
    then((value)  {
             Navigator.pop(context);
           ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
          content: Text('Post Create with Id ${value.id}')));
    }).catchError((e){
      loading.value = false;
      ScaffoldMessenger.of(context).showSnackBar(
         const  SnackBar(
              content: Text('Something went wrong')));
    });
  }
}