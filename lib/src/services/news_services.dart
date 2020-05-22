
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';

final _urlNews  = 'https://newsapi.org/v2';
final _apiKey   = '585726626d7747ab8926c7d3671fe292';
class NewsService with ChangeNotifier{

  List<Article> headlines = []; 

  String _selectedCategory = 'Buissiness';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'Bussiness'),
    Category(FontAwesomeIcons.tv, 'Entertaiment'),
    Category(FontAwesomeIcons.addressCard, 'General'),
    Category(FontAwesomeIcons.headSideVirus, 'Health'),
    Category(FontAwesomeIcons.vials, 'Science'),
    Category(FontAwesomeIcons.volleyballBall, 'Sports'),
    Category(FontAwesomeIcons.memory, 'Technology'),

  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService(){
    this.getDocHeadlines();
    categories.forEach((item) { 
      this.categoryArticles[item.categoryName] = new List();
    });
    this.getArticlesByCategory( this._selectedCategory );
  }

  get selectedCategory => this._selectedCategory;
  set selectedCategory ( String value ){
    this._selectedCategory = value;
    this.getArticlesByCategory(value);
    notifyListeners();
  }

  //Getter to get category selected
  List<Article> get getArticlesCategorySelected => this.categoryArticles[this.selectedCategory];

  getDocHeadlines() async {
    
    final url = '$_urlNews/top-headlines?apiKey=$_apiKey&country=us';
    final response = await http.get(url);
    final newsResponse = newsResponseFromJson(response.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {

    if (this.categoryArticles[category].length > 0) {
      return this.categoryArticles[category];
    } 
    final url = '$_urlNews/top-headlines?apiKey=$_apiKey&country=us&category=$category';
    final response = await http.get(url);
    final newsResponse = newsResponseFromJson(response.body);
    this.categoryArticles[category].addAll(newsResponse.articles);
    notifyListeners();
  }

}