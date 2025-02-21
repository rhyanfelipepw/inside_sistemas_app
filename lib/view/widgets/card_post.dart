import 'package:flutter/material.dart';
import 'package:inside_sistemas_teste_app/model/post_model.dart';
import 'package:inside_sistemas_teste_app/util/constants.dart';
import 'package:inside_sistemas_teste_app/view/detail_post.dart';

// ignore: must_be_immutable
class CardPost extends StatefulWidget {
  Post post;
  CardPost({super.key, required this.post});

  @override
  State<CardPost> createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PostDetail(post: widget.post)),
        );
      },
      child: Hero(
        tag: 'post-title-${widget.post.id}',
        child: Card(
          elevation: 2,
          // ignore: deprecated_member_use
          color: Constants.mainColorApp.withOpacity(0.3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.post.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Constants.secondColorApp,
                    fontFamily: 'gilroy',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.post.description,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
