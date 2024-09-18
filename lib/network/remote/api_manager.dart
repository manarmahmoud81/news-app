import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/constant/constants.dart';
import 'package:news/models/NewsDataModel.dart';
import 'package:news/models/SourcesResponse.dart';

class ApiManager {
  static Future<SourcesResponse> getSources(String categoryId) async {
    Uri uri = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apikey": "1c78451cec8d4d789f794d25f77696a8", "category": categoryId});
    var response = await http.get(uri);
    print(response.body);
    var jsonData = jsonDecode(response.body);
    SourcesResponse sourceResponse = SourcesResponse.fromJson(jsonData);
    return sourceResponse;
  }

  static Future<NewsDataModel> getNewsData(
      {String? sourceId, String? searchKeyword}) async {
    Uri url = Uri.https(Constants.BASE_URL, "/v2/everything", {
      "apiKey": Constants.API_KEY,
      "sources": sourceId,
      "q": searchKeyword,
    });
    http.get(url);
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(jsonData);
    return newsDataModel;
  }
}
