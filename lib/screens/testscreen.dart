import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/category_model.dart';

import '../componants/drawer_item.dart';

class testscreen extends StatefulWidget {
  static const String routeName = 'test';
  CategoryModel categoryModel;

  testscreen(this.categoryModel);

  @override
  State<testscreen> createState() => _testscreenState();
}

class _testscreenState extends State<testscreen> {
  int currentSource = 0;
  bool isIconClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerItem(onDrawerClicked),
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        titleSpacing: 1,
        toolbarHeight: 60,
        title: Text(
          "News App",
          style: GoogleFonts.elMessiri(fontWeight: FontWeight.w100),
        ),
        centerTitle: true,

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
      body: SearchBox(),
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

  Widget SearchBox() {
    return Container(
      width: 250,
      height: 42,
      child: TextFormField(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          hintText: "Search Article",
          hintStyle: TextStyle(
            color: Colors.green,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          prefixIcon: IconButton(
            color: Colors.green,
            icon: Icon(
              Icons.clear,
              size: 22,
            ),
            onPressed: () {
              isIconClicked = !isIconClicked;
              setState(() {});
            },
          ),
          fillColor: Colors.white,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          suffixIcon: IconButton(
            color: Colors.green,
            icon: Icon(
              Icons.search,
              size: 22,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
