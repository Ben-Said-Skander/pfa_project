import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  const BlogCard(
      {super.key, required this.blogTitle, required this.blogPicture});
  final String blogTitle;
  final String blogPicture;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 1,
              color: Color.fromARGB(255, 207, 207, 207),
            )
          ]),
      width: 200,
      height: 100,
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Image.asset(
                blogPicture,
                width: 200,
                height: 100,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 7),
            child: Text(
              blogTitle,
              style: TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
