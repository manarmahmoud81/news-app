import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../models/NewsDataModel.dart';

class WebViewAllNews extends StatefulWidget {
  @override
  State<WebViewAllNews> createState() => _WebViewAllNewsState();

  Articles articles;

  WebViewAllNews({required this.articles});
}

class _WebViewAllNewsState extends State<WebViewAllNews> {
  List data = [];
  bool isLoading = true;

  //WebViewController controller = WebViewController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //changeUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          leading: Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back)),
              Container(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage(widget.articles.urlToImage ?? ""),
                ),
              ),
            ],
          ),
          title: Text(
            widget.articles.title ?? "",
            maxLines: 1,
          ),
          centerTitle: true,
        ),
        body: WebView(
          initialUrl: widget.articles.url,
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}
