import 'package:dio_instagram/comment/widgets/comment_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/commentModel.dart';
import '../../models/postModel.dart';
import '../../service/comment_service.dart';
import '../../service/post_service.dart';
import '../../service/utils_service.dart';

class CommentPage extends StatefulWidget {
   CommentPage({this.id,Key? key}) : super(key: key);
int? id;
  @override
  State<CommentPage> createState() => _CommentPageState();
}
TextEditingController nameCtr = TextEditingController();
TextEditingController emailCtr = TextEditingController();
TextEditingController bodyCtr = TextEditingController();
TextEditingController commentIdCtr = TextEditingController();

class _CommentPageState extends State<CommentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Comments', style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            onPressed: (){
              commentIdCtr.text = '';
              nameCtr.text = '';
              emailCtr.text = '';
              bodyCtr.text = '';
              _showBottomSheet(context, () async {
                if(nameCtr.text.isNotEmpty && emailCtr.text.isNotEmpty && bodyCtr.text.isNotEmpty) {
                  PostModel newPost = PostModel(
                      userId: int.parse(nameCtr.text),
                      id: 1,
                      title: emailCtr.text,
                      body: bodyCtr.text);
                  bool result = await GetPostService.createPost(newPost);

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
          future: GetCommetService.getCommet(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i){
                      return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: CommetItem(context: context,comment:  snapshot.data![i],
                            edit: () {
                          commentIdCtr.text = snapshot.data![i].id.toString();
                          nameCtr.text = snapshot.data![i].name;
                          emailCtr.text = snapshot.data![i].email;
                          bodyCtr.text = snapshot.data![i].body;
                          _showBottomSheet(context,
                              () async {
                                if(nameCtr.text.isNotEmpty && emailCtr.text.isNotEmpty && bodyCtr.text.isNotEmpty) {
                                  CommentModel newPost = CommentModel(
                                    postId: snapshot.data![i].postId,
                                      id: snapshot.data![i].id,
                                      email: emailCtr.text,
                                      name: nameCtr.text,
                                      body: bodyCtr.text, );
                                  bool result = await GetCommetService.editComment(newPost);

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
                  'Add new post',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
                TextFormField(
                  controller: nameCtr,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'UserId'),
                ),
                TextFormField(
                  controller: emailCtr,
                  decoration: InputDecoration(labelText: 'Age'),
                ),
                TextFormField(
                  controller: bodyCtr,
                  decoration: InputDecoration(labelText: 'Salary'),
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
