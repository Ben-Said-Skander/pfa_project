// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/blog_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/core/constants/routes.dart';
import 'package:pfa_application_1/models/blog.dart';
import 'package:pfa_application_1/view/widgets/component/blog_card.dart';

class MissingBlog extends StatefulWidget {
  const MissingBlog({super.key});

  @override
  State<MissingBlog> createState() => _MissingBlogState();
}

class _MissingBlogState extends State<MissingBlog> {
  BlogController blogController = Get.find();
  late Future<List<Blog>> futureCard;
  @override
  void initState() {
    futureCard = blogController.fetchArticles();
    super.initState();
  }

  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn3',
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
                  "Missing Drug",
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
            padding: EdgeInsets.only(top: 10),
            child: Obx(() => FutureBuilder<List<Blog>>(
                future: blogController.fetchArticles(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    List<Widget> articleWidgets = [];
                    for (int i = 0; i < snapshot.data!.length; i++) {
                      if (snapshot.data![i].category == "In need of a missing drug") {
                        
                        articleWidgets.add(BlogCard(
                            blogTitle: "${snapshot.data![i].title}",
                            blogPicture: "assets/image/piills.jpg"));
                      }
                    }
                    if (articleWidgets.isNotEmpty) {
                      return GridView.count(
                        crossAxisCount: 2,
                        children: articleWidgets,
                      );
                    } else {
                      return Text("No data to show");
                    }
                  } else if (snapshot.hasError) {
                    return Text("Error loading data");
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Color.fromARGB(255, 16, 152, 170),
                      value: 5,
                    ));
                  }
                }))))
       
      ]),
    );
  }
}
