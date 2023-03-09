import 'package:dio_instagram/photo/widgets/photo_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../service/photo_service.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Photos', style: TextStyle(color: Colors.white),),
        centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: FutureBuilder(
          future: GetPhotoService.getPhoto(),
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

