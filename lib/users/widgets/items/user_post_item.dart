import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../models/postModel.dart';
import '../../userCommentPage.dart';

Widget UserPostItem({required BuildContext context, required PostModel post, required void Function() edit}) {
  return Row(
    children: [
      Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width*0.72,
          child: Text(
            post.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.black
            ),
          ),
        ),
        SizedBox(height: 5,),
        SizedBox(
          width: MediaQuery.of(context).size.width*0.72,
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
      ],
    ),
      SizedBox(width: 5,),
      Column(
        children: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.favorite_border, color: Colors.red,)),
          SizedBox(height: 10,),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserCommentPage(id: post.id)),
                );
              },
              icon: Icon(Icons.comment)),
        ],
      ),
    ]
  );
}