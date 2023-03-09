import 'package:dio_instagram/posts/posts_page.dart';
import 'package:dio_instagram/users/usres_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'albums/albums_page.dart';

class MainView extends StatefulWidget {
  MainView({this.id,Key? key}) : super(key: key);
  int? id;
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent.shade700,
        title: Text('User',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.normal
          ),),
        bottom: TabBar(
          indicatorColor: Colors.black45,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          controller: tabController,
          isScrollable: true,
          tabs: [
            Tab(
              text: 'Posts',
            ),
            Tab(
              text: 'Albums',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller:tabController ,
        children: [
          PostsPage(),
          UsersPage(),
          AlbumsPage(),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/ContactPage');
      //   },
      //   child: Icon(Icons.edit),
      //
      // ),
    );
  }
}