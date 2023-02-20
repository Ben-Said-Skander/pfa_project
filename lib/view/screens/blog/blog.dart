// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';

class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addBlog);
        },
        backgroundColor: AppColor.mainColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          SafeArea(
            child: Container(
              height: 120,
              width: 500,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(80)),
                color: Color.fromARGB(255, 16, 152, 170),
              ),
              child: Row(
                children: [
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoute.settings);
                          },
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/image/me2.jpg",
                            ),
                            radius: 28,
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Text(
                    "Ben Said Skander",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontFamily: "Poppins"),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                textButton(
                    context, "Drug Experience", "blog", AppColor.mainColor),
                textButton(context, "Missing Drug", "missingBlog", Colors.grey),
                textButton(context, "Seeking Help", "helpBlog", Colors.grey),
                textButton(
                    context, "Your Articles", "userArticle", Colors.grey),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 28, 0, 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Drug Experience",
                    style: TextStyle(
                        color: AppColor.mainColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.seeAll);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                          "See all",
                          style: TextStyle(color: Colors.black),
                        ),
                      ))
                ]),
          ),
          Container(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  BlogCard(
                      blogTitle: "My experience with Doliprane",
                      blogPicture: "assets/image/piills.jpg"),
                  BlogCard(
                      blogTitle: "My experience with Doliprane",
                      blogPicture: "assets/image/piills.jpg"),
                  BlogCard(
                      blogTitle: "My experience with Doliprane",
                      blogPicture: "assets/image/piills.jpg"),
                ],
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 28, 0, 15),
            child: Text(
              "Popular",
              style: TextStyle(
                  color: AppColor.mainColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                  fontSize: 18),
            ),
          ),
          PopularCard(
            blogTitle: "My experience with Doliprane",
            blogPicture: "assets/image/sirop.jpg",
            route: "/blog/details",
          ),
          PopularCard(
            blogTitle: "My experience with Doliprane",
            blogPicture: "assets/image/doliprane.jpg",
            route: "/blog/details",
          ),
          PopularCard(
            blogTitle: "My experience with Doliprane",
            blogPicture: "assets/image/doliprane.jpg",
            route: "/blog/details",
          ),
        ],
      ),
    );
  }
}

textButton(BuildContext context, String title, String route, Color couleur) {
  return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: TextButton(
        onPressed: () {
          Get.toNamed(route);
        },
        child: Text(title, style: TextStyle(fontSize: 14, color: couleur)),
      ));
}

class BlogCard extends StatelessWidget {
  const BlogCard(
      {super.key, required this.blogTitle, required this.blogPicture});
  final String blogTitle;
  final String blogPicture;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(AppRoute.blogdetails);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
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
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    blogPicture,
                    width: 150,
                    height: 100,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  blogTitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ));
  }
}

class PopularCard extends StatelessWidget {
  const PopularCard(
      {super.key,
      required this.blogTitle,
      required this.blogPicture,
      required this.route});
  final String blogTitle;
  final String blogPicture;
  final String route;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: () {
          Get.toNamed(route);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 1,
                  color: Color.fromARGB(255, 207, 207, 207),
                )
              ]),
          width: 600,
          height: 120,
          margin: EdgeInsets.all(16),
          child: Row(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 10),
                  child: Image.asset(
                    blogPicture,
                    width: 150,
                    height: 100,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  blogTitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
    /*  GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("/blog/details");
        },*/
  }
}
