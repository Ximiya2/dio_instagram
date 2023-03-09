import 'package:dio_instagram/users/widgets/items/user_albums_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../service/userId_service.dart';

class UserAlbumsPage extends StatefulWidget {
   UserAlbumsPage({this.id,Key? key}) : super(key: key);
int? id;
  @override
  State<UserAlbumsPage> createState() => _UserAlbumsPageState();
}
TextEditingController idCtr = TextEditingController();
TextEditingController titleCtr = TextEditingController();
TextEditingController userIdCtr = TextEditingController();

class _UserAlbumsPageState extends State<UserAlbumsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blueGrey,
      //   title: Text('Albums', style: TextStyle(color: Colors.white),),
      //   actions: [
      //     IconButton(
      //       onPressed: (){
      //         userIdCtr.text = '';
      //         idCtr.text = '';
      //         titleCtr.text = '';
      //         _showBottomSheet(context, () async {
      //           if(idCtr.text.isNotEmpty && titleCtr.text.isNotEmpty) {
      //             AlbumsModel newPost = AlbumsModel(
      //               userId: widget.id!,
      //               id: 1,
      //               title: titleCtr.text,);
      //             bool result = await GetAlbumsService.createAlbums(newPost);
      //
      //             if(result){
      //               Utils.snackBarSucces('Added successfully', context);
      //               Navigator.pop(context);
      //             } else {
      //               Utils.snackBarError('Someting is wrong', context);
      //             }
      //           } else {
      //             Utils.snackBarError('Please fill all fileds', context);
      //           }
      //         });
      //       },
      //       icon: Icon(Icons.add),)
      //   ],
      //   centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: GetUserPostService.getUserIdAlbum(widget.id!),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i){
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: UserAlbumsItem(
                            context,
                            snapshot.data![i],
                                () {
                                  userIdCtr.text = widget.id.toString();
                                  idCtr.text = snapshot.data![i].id.toString();
                                  titleCtr.text = snapshot.data![i].title;
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
