// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/blog_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/models/blog.dart';
import 'package:pfa_application_1/view/widgets/component/blog_card.dart';

class HelpBlog extends StatefulWidget {
  const HelpBlog({super.key});

  @override
  State<HelpBlog> createState() => _HelpBlogState();
}

class _HelpBlogState extends State<HelpBlog> {
  BlogController blogController = Get.find();
  late Future<List<Blog>> futureCard;
  @override
  void initState() {
    futureCard = blogController.fetchArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn4',
        onPressed: () {
          Get.toNamed(AppRoute.addBlog);
        },
        backgroundColor: AppColor.mainColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView(children: [
        SafeArea(
          child: Container(
            height: 120,
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
              color: Color.fromARGB(255, 16, 152, 170),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 22,
                ),
                Text(
                  "Seeking Help",
                  style: TextStyle(
                      color: Colors.white, fontSize: 19, fontFamily: "Poppins"),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                "All Articles ",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoute.searchArticles);
                },
                icon: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        Container(
            height: 560,
            padding: EdgeInsets.only(top: 35),
            child: FutureBuilder<List<Blog>>(
                future: futureCard,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        itemCount: snapshot.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                AppRoute.blogdetails, /*parameters:*/
                              );
                            },
                            child: BlogCard(
                                blogTitle: "${snapshot.data![index].title}",
                                blogPicture: "assets/image/piills.jpg"),
                          );
                        }));
                  } else {
                    return GridView.builder(
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  AppRoute.blogdetails, /*parameters:*/
                                );
                              },
                              child: BlogCard(
                                  blogTitle: "My experience with Doliprane",
                                  blogPicture: "assets/image/piills.jpg"));
                        }));
                    /*
                    return Center(
                        child: Text("No Articles found",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Poppins")));*/
                  }
                }))),
      ]),
    );
  }
}
