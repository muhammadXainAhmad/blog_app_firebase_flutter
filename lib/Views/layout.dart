import 'package:blog_app_firebase/Views/add_blog.dart';
import 'package:blog_app_firebase/Views/home.dart';
import 'package:blog_app_firebase/Views/nav_bar.dart';
import 'package:blog_app_firebase/Views/profile.dart';
import 'package:blog_app_firebase/provider/nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavBarProvider>(context);
    final pages = [HomePage(), AddBlogPage(), ProfilePage()];
    return Scaffold(
      bottomNavigationBar: HomeNavBar(),
      body: pages[navProvider.selectedIndex],
    );
  }
}
