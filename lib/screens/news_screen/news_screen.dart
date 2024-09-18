import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';

import '../../componants/sources_title.dart';
import '../../network/remote/api_manager.dart';

class NewsScreen extends StatefulWidget {
  CategoryModel categoryModel;

  NewsScreen(this.categoryModel);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset); // <-- This is it.
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.categoryModel.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("something went wrong"));
        }
        var sources = snapshot.data?.sources ?? [];
        return SourcesTitle(sources);
      },
    );
  }
}
