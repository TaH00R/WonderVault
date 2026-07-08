import 'package:flutter/material.dart';
import 'package:wondervault/pages/gallery_page.dart';
import 'package:wondervault/pages/map_screen.dart';
import 'package:wondervault/widgets/app_bar.dart';
import 'package:wondervault/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
  body: IndexedStack(
    index: selectedIndex,
    children: const [
      MapScreen(),
      GalleryPage(),
    ],
  ),
  bottomNavigationBar: WonderBottomNavBar(
    selectedIndex: selectedIndex,
    onTap: (index) {
      setState(() {
        selectedIndex = index;
      });
    },
  ),
);
  }
}