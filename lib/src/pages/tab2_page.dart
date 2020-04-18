import 'package:flutter/material.dart';
import 'package:newsapp/src/services/news_services.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(child: _CategoryList())
          ],
        )    
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  final categories = Provider.of<NewsService>(context).categories;
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index){
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Icon(categories[index].icon),
              SizedBox(height: 5.0),
              Text(categories[index].categoryName),
            ],
          ),
        );
      },
    );
  }
}