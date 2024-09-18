import 'package:flutter/material.dart';

import '../../componants/news_item.dart';
import '../../models/NewsDataModel.dart';
import '../../network/remote/api_manager.dart';

class NewsSearch extends SearchDelegate {
  late Future<NewsDataModel> getNewsDataModel;

  NewsSearch() {
    getNewsDataModel = ApiManager.getNewsData(searchKeyword: "");
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: Icon(Icons.search),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.clear,
        size: 32,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNewsData(searchKeyword: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("something went wrong"));
        }
        var articls = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(articls[index]);
            },
            itemCount: articls.length,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('xd'),
    );
  }
}
