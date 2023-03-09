import 'package:dio_instagram/comment/comment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/postModel.dart';

Widget PostItem({required BuildContext context, required PostModel post,}) {
  return Column(
    children: [
      Text(
        post.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: Colors.black
        ),
      ),
      SizedBox(height: 5,),
      SizedBox(
        width: MediaQuery.of(context).size.width*0.8,
        height: MediaQuery.of(context).size.height*0.2,
        child: Expanded(
            child: Text(
              post.body,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black38
              ),
            ),
        ),
      ),
      Row(
        children: [
          Icon(Icons.favorite, color: Colors.red,),
          IconButton(
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> CommentPage(id: post.id)));
              },
              icon: Icon(Icons.message),
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.send, color: Colors.blue,),
          ),
        ],
      ),
      Divider(thickness: 1,)
    ],
  );
}