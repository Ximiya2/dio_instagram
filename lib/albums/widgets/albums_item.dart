import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/AlbumsModel.dart';
import '../../../service/album_service.dart';
import '../../../service/comment_service.dart';
import '../../../service/utils_service.dart';
import '../../users/userAlbum_page.dart';

Widget AlbumsItem(BuildContext context, AlbumsModel albums, void Function() edit) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: Text(
            albums.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black38
            ),),
          ),
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
                      MaterialPageRoute(builder: (context) => UserAlbumsPage(id: albums.id)),
                    );
                  },
                  icon: Icon(Icons.comment)),
            ],
          ),
          // Text(
          //   albums.userId.toString(),
          //   style: TextStyle(
          //       fontWeight: FontWeight.w700,
          //       fontSize: 16,
          //       color: Colors.black38
          //   ),),
        ],
      ),
    ],
  );
}