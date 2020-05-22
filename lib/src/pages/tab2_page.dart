import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/services/news_services.dart';
import 'package:newsapp/src/theme/my_theme.dart';
import 'package:newsapp/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _CategoryList(),
            // show category selected
            Expanded(
              child: newService.getArticlesCategorySelected.length == 0 ?
              Center( child: Text('No hay noticias en esta sección', textScaleFactor: 1.2,),) 
              : ListNews(newService.getArticlesCategorySelected),
            )
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
    return Container(
      width: double.infinity,
      height: 85.0,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                _CategoryButton(categories[index],),
                SizedBox(height: 5.0),
                Text(categories[index].categoryName),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {

  final Category category;
  const _CategoryButton(this.category);


  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: (){
        final newService = Provider.of<NewsService>(context, listen: false);
        newService.selectedCategory = category.categoryName;
      },
      child: Container(
        width: 40.0,
        height: 40.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          category.icon, color: newService.selectedCategory == category.categoryName ? myTheme.accentColor : Colors.black54
        ),
      ),
    );
  }
}