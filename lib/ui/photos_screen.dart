import 'package:flutter/material.dart';
import 'package:typi_code_sample2/network/apiservice.dart';

import 'package:typi_code_sample2/model/photomodel.dart';
import 'package:typi_code_sample2/ui/photo_list_item.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {

  late Future<List<PhotoModel>> list ;

  @override
  void initState() {
    list = ApiService().getPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Photos'),
      ),
      body: FutureBuilder(future: list,builder:(context,snapshot){
          return _handleSnapshot(snapshot);
      },),
    );
  }

 Widget _handleSnapshot(AsyncSnapshot<List<PhotoModel>> snapshot){
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

  Widget _buildList (List <PhotoModel> list){
    if(list.isEmpty) {
      return _buildError('No data');
    }

      return ListView.builder(
          itemCount: list.length > 50 ? 50 : list.length,
          itemBuilder: (context,index) {
           return PhotoListItem(
              photo:list[index],
            );
          });
    }
  }

