import 'package:dio_instagram/albums/widgets/albums_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/AlbumsModel.dart';
import '../service/album_service.dart';
import '../service/utils_service.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({Key? key}) : super(key: key);

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}
TextEditingController idCtr = TextEditingController();
TextEditingController titleCtr = TextEditingController();
TextEditingController userIdCtr = TextEditingController();

class _AlbumsPageState extends State<AlbumsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Albums', style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            onPressed: (){
              userIdCtr.text = '';
              idCtr.text = '';
              titleCtr.text = '';
              _showBottomSheet(context, () async {
                if(idCtr.text.isNotEmpty && titleCtr.text.isNotEmpty) {
                  AlbumsModel newPost = AlbumsModel(
                      userId: int.parse(idCtr.text),
                      id: 1,
                      title: titleCtr.text,);
                  bool result = await GetAlbumsService.createAlbums(newPost);

                  if(result){
                    Utils.snackBarSucces('Added successfully', context);
                    Navigator.pop(context);
                  } else {
                    Utils.snackBarError('Someting is wrong', context);
                  }
                } else {
                  Utils.snackBarError('Please fill all fileds', context);
                }
              });
            },
            icon: Icon(Icons.add),)
        ],
        centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: GetAlbumsService.getAlbums(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i){
                      return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: AlbumsItem(context, snapshot.data![i],
                            () {
                          userIdCtr.text = snapshot.data![i].userId.toString();
                          idCtr.text = snapshot.data![i].id.toString();
                          titleCtr.text = snapshot.data![i].title;
                          _showBottomSheet(context,
                              () async {
                                if(idCtr.text.isNotEmpty && titleCtr.text.isNotEmpty) {
                                  AlbumsModel newPost = AlbumsModel(
                                    userId: snapshot.data![i].userId,
                                      id: snapshot.data![i].id,
                                      title: titleCtr.text,);
                                  bool result = await GetAlbumsService.editAlbums(newPost);

                                  if(result){
                                    Utils.snackBarSucces('Update successfully', context);
                                    Navigator.pop(context);
                                  } else {
                                    Utils.snackBarError('Someting is wrong', context);
                                  }
                                } else {
                                  Utils.snackBarError('Please fill all fileds', context);
                                }
                              });
                            }),
                      );
                    });
              } else {
                return const Center(
                  child: Text('No data'),);
              }
            }),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context, void Function() func) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context,) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Add new album',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
                TextFormField(
                  controller: titleCtr,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                ElevatedButton(
                  onPressed: func,
                  child: Text('Add'),
                ),
                SizedBox(height: 400,)
              ],
            ),
          ),
        );
      });
}
