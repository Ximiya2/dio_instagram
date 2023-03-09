import 'package:dio_instagram/users/widgets/items/user_post_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../service/userId_service.dart';

class UserPostsPage extends StatefulWidget {
   UserPostsPage({this.id,Key? key}) : super(key: key);
   int? id;

  @override
  State<UserPostsPage> createState() => _UserPostsPageState();
}
TextEditingController userIdCtr = TextEditingController();
TextEditingController titleCtr = TextEditingController();
TextEditingController bodyCtr = TextEditingController();

class _UserPostsPageState extends State<UserPostsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blueGrey,
      //   title: Text('User Posts', style: TextStyle(color: Colors.white),),
      //   actions: [
      //     IconButton(
      //       onPressed: (){
      //         _showBottomSheet(context, () async {
      //           if(userIdCtr.text.isNotEmpty && titleCtr.text.isNotEmpty && bodyCtr.text.isNotEmpty) {
      //             PostModel newPost = PostModel(
      //                 userId: widget.id!,
      //                 id: 1,
      //                 title: titleCtr.text,
      //                 body: bodyCtr.text);
      //             bool result = await GetPostService.createPost(newPost);
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
            future: GetUserPostService.getUserIdPost(widget.id!),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i){
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: UserPostItem(context: context, post: snapshot.data![i],
                            edit: () {
                              userIdCtr.text = widget.id!.toString();
                              titleCtr.text = snapshot.data![i].title;
                              bodyCtr.text = snapshot.data![i].body;
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
