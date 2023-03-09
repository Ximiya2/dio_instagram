import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../photo/widgets/photo_item.dart';
import '../service/userId_service.dart';

class UserPhotoPage extends StatefulWidget {
   UserPhotoPage({this.id,Key? key}) : super(key: key);
int? id;
  @override
  State<UserPhotoPage> createState() => _UserPhotoPageState();
}

class _UserPhotoPageState extends State<UserPhotoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Album Photos', style: TextStyle(color: Colors.white),),
        centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: FutureBuilder(
            future: GetUserPostService.getUserIdPhoto(widget.id!),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return PhotoItem(snapshot.data![index]);
                  },
                );
              } else {
                return const Center(
                  child: Text('No data'),);
              }
            }),
      ),
    );
  }
}

