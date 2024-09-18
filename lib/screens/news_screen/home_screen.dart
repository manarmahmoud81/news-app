import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/news_screen/catigories_screen.dart';
import 'package:news/screens/news_screen/news_screen.dart';
import 'package:news/screens/news_screen/search_widget.dart';

import '../../componants/drawer_item.dart';
import '../../models/NewsDataModel.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'news';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSource = 0;
  bool isIconClicked = false;
  List<Articles> allArticles = []; // Replace this with your article data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:
          // isIconClicked ? SearchBox() :
          DrawerItem(onDrawerClicked),
      appBar: AppBar(
        titleSpacing: 1,
        toolbarHeight: 60,
        //  isIconClicked ? SearchBox() :
        title: buildAppBarTitle(),
        centerTitle: true,
        actions: [
          // isIconClicked ? SearchBox() :
          IconButton(
            onPressed: () {
              // isIconClicked = !isIconClicked;
              setState(() {
                showSearch(context: context, delegate: NewsSearch());
              });
            },
            icon: Icon(Icons.search),
          ),
        ],
        backgroundColor: Color(0xFF39A552),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      // body: SearchBox(),
      body: model == null
          ? CategoriesScreen(onCategoryClicked)
          : NewsScreen(model!),
    );
  }

  CategoryModel? model = null;

  onCategoryClicked(categorymodel) {
    model = categorymodel;
    setState(() {});
  }

  onDrawerClicked(number) {
    if (number == DrawerItem.category) {
      model = null;
      Navigator.pop(context);
      setState(() {});
    } else if (number == DrawerItem.setting) {}
  }

  Widget buildAppBarTitle() {
    return Center(
      child: Container(
        child: Text(
          "News App",
          style: GoogleFonts.elMessiri(fontWeight: FontWeight.w100),
        ),
      ),
    );
  }
}
