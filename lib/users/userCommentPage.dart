import 'package:dio_instagram/users/widgets/items/user_comment_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../service/userId_service.dart';

class UserCommentPage extends StatefulWidget {
  UserCommentPage({this.id,Key? key}) : super(key: key);
  int? id;

  @override
  State<UserCommentPage> createState() => _UserCommentPageState();
}
TextEditingController userIdCtr = TextEditingController();
TextEditingController titleCtr = TextEditingController();
TextEditingController bodyCtr = TextEditingController();

class _UserCommentPageState extends State<UserCommentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Post Comments', style: TextStyle(color: Colors.white),),
        // actions: [
        //   IconButton(
        //     onPressed: (){
        //       _showBottomSheet(context, () async {
        //         if(userIdCtr.text.isNotEmpty && titleCtr.text.isNotEmpty && bodyCtr.text.isNotEmpty) {
        //           PostModel newPost = PostModel(
        //               userId: widget.id!,
        //               id: 1,
        //               title: titleCtr.text,
        //               body: bodyCtr.text);
        //           bool result = await GetPostService.createPost(newPost);
        //
        //           if(result){
        //             Utils.snackBarSucces('Added successfully', context);
        //             Navigator.pop(context);
        //           } else {
        //             Utils.snackBarError('Someting is wrong', context);
        //           }
        //         } else {
        //           Utils.snackBarError('Please fill all fileds', context);
        //         }
        //       });
        //     },
        //     icon: Icon(Icons.add),)
        // ],
        centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: GetUserPostService.getUserIdComment(widget.id!),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i){
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: UserCommetItem(
                            context: context,
                            comment: snapshot.data![i],
                        ),
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
