import 'package:dio_instagram/models/usersModel.dart';
import 'package:dio_instagram/users/widgets/users_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../service/users_service.dart';

List<UsersModel> userListSearch= [];

class UsersPage extends StatefulWidget {
   UsersPage({Key? key}) : super(key: key);


  @override
  State<UsersPage> createState() => _UsersPageState();
}
TextEditingController nameCtr = TextEditingController();


class _UsersPageState extends State<UsersPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Users', style: TextStyle(color: Colors.white),),
        actions: [

        ],
        centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: GetUsersService.getUsers(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                userListSearch.addAll(snapshot.data!);
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i){
                      return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: UsersItem(context, snapshot.data![i],),
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

