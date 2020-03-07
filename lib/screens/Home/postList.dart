import 'package:flutter/material.dart';
import 'package:heatlhore/models/Post.dart';
import 'package:heatlhore/services/database.dart';
import 'package:provider/provider.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  // var data=DatabaseService().posts;
  @override
  Widget build(BuildContext context) {
    return Container(
       
      child: Text("data"),
    );
  }
}
