// ignore_for_file: unused_element, unused_local_variable
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pfa_application_1/controllers/blog_controller.dart';
import 'package:pfa_application_1/core/constants/colors.dart';
import 'package:pfa_application_1/models/blog.dart';
import 'package:pfa_application_1/view/widgets/component/blog_card.dart';

class SearchArticles extends StatefulWidget {
  const SearchArticles({super.key});

  @override
  State<SearchArticles> createState() => _SearchArticlesState();
}

class _SearchArticlesState extends State<SearchArticles> {
  BlogController blogController = Get.find();
  List<Blog> articles = [];
  List<Blog> filteredArticles = [];
  late TextEditingController searchController;

  /* late final Future<List<Pharmacy>> futureLocations =
      pharmacyController.getAllPharmacies();*/
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    fetchArticles().then((articleFromServer) {
      setState(() {
        articles = articleFromServer;
        filteredArticles = articles;
      });
    });
    searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 60, left: 5, right: 30),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  Text("Search for article",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.mainColor,
                          fontSize: 20,
                          fontFamily: "Poppins")),
                ],
              )),
          Container(
            padding: EdgeInsets.only(top: 40, left: 20),
            width: 400,
            child: TextFormField(
              onChanged: (titleEntered) {
                filteredArticles = articles
                    .where((article) => article.title!
                        .toLowerCase()
                        .contains(titleEntered.toLowerCase()))
                    .toList();
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Search for an article",
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass,
                    color: AppColor.mainColor),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.mainColor),
                    borderRadius: BorderRadius.circular(30)),
              ),
              controller: searchController,
              cursorColor: Color.fromARGB(255, 16, 152, 170),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: filteredArticles.length,
              itemBuilder: ((context, index) {
                return BlogCard(
                    blogTitle: filteredArticles[index].title!,
                    blogPicture: 'blogPicture');
              }))
        ],
      ),
    );
  }
}

Future<List<Blog>> fetchArticles() async {
  List<Blog> totalArticles = [];
  final response =
      await http.get(Uri.parse('http://192.168.101.161:3600/blog'));

  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    totalArticles = parsed.map<Blog>((e) => Blog.fromJson(e)).toList();
    ;
    print(totalArticles);
    return totalArticles;
  } else {
    throw Exception('Failed to load Articles');
  }
}
