import 'package:flutter/material.dart';
import 'package:inside_sistemas_teste_app/model/post_model.dart';
import 'package:inside_sistemas_teste_app/util/constants.dart';

class PostDetail extends StatefulWidget {
  Post post;
  PostDetail({super.key, required this.post});

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    return  Hero(
      tag: 'post-title-${widget.post.id}', 
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading:
              true,
          iconTheme: IconThemeData(color: Constants.secondColorApp),
          leading: IconButton(onPressed: () { Navigator.pop(context);}, icon: Icon(Icons.arrow_back),),
          title: Text(
            'Detalhes do Post',
            style: TextStyle(color: Constants.secondColorApp),
          ),
          
          backgroundColor:
              Constants.mainColorApp,
        ),
        backgroundColor: Constants.mainColorApp,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero widget for title animation
              Text(
                widget.post.title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
      
              const SizedBox(height: 20),
              Text(
                widget.post.description,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
