import 'package:blog_app_firebase/Views/blog_container.dart';
import 'package:blog_app_firebase/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ValueNotifier<String> searchQuery = ValueNotifier<String>("");
  final TextEditingController searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgClr,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "BLOGD",
                  style: TextStyle(
                    color: blackClr,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ".",
                  style: TextStyle(color: primaryClr, fontSize: 40),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: bgClr,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: TextField(
              controller: searchController,
              onChanged: (val) => searchQuery.value = val.toLowerCase(),
              decoration: InputDecoration(
                hintText: "Search blogs ...",
                prefixIcon: Icon(Icons.search, color: blackClr),
                suffixIcon: ValueListenableBuilder<String>(
                  valueListenable: searchQuery,
                  builder: (context, query, _) {
                    if (query.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return IconButton(
                      icon: Icon(Icons.clear, color: blackClr),
                      onPressed: () {
                        searchController.clear();
                        searchQuery.value = "";
                      },
                    );
                  },
                ),
                filled: true,
                fillColor: whiteClr,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance
                .collection("blogs")
                .orderBy("postedAt", descending: true)
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: blackClr, strokeWidth: 2),
            );
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                "No blogs available.",
                style: TextStyle(color: blackClr),
              ),
            );
          }
          return ValueListenableBuilder<String>(
            valueListenable: searchQuery,
            builder: (context, query, _) {
              final blogs =
                  snapshot.data!.docs.where((doc) {
                    final title = doc["blogTitle"].toString().toLowerCase();
                    return title.contains(query);
                  }).toList();

              if (blogs.isEmpty) {
                return Center(
                  child: Text(
                    "No blogs found.",
                    style: TextStyle(color: blackClr),
                  ),
                );
              }
              return ListView.builder(
                itemCount: blogs.length,
                itemBuilder: (context, index) {
                  return BlogContainer(snap: blogs[index].data());
                },
              );
            },
          );
        },
      ),
    );
  }
}
