import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../models/commentModel.dart';

Widget UserCommetItem({required BuildContext context, required CommentModel comment,}) {
  return Column(
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width*0.3,
              child: Text(
                comment.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.black
                ),),
            ),
            SizedBox(width: 5,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.5,
              child: Text(
               '(${comment.email})',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.blue
                ),),
            ),
          ],
        ),
      ),
      SizedBox(height: 10,),
      Row(
        children: [
          Expanded(
            child: Text(
            comment.body,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black38
            ),),
          ),

        ],
      ),
    ],
  );
}