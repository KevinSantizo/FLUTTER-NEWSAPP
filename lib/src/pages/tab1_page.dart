import 'package:flutter/material.dart';
import 'package:newsapp/src/services/news_services.dart';
import 'package:newsapp/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class TabOnePage extends StatefulWidget {
  @override
  _TabOnePageState createState() => _TabOnePageState();
}

class _TabOnePageState extends State<TabOnePage> with AutomaticKeepAliveClientMixin {
  


  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsService>(context).headlines;
    
    return Scaffold(
      body: (headlines.length ==0)
          ? Center(child: CircularProgressIndicator(),)
          : ListNews(headlines)
    );
    
  }

  @override
  bool get wantKeepAlive => true;
}