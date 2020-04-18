
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';

final _urlNews  = 'https://newsapi.org/v2';
final _apiKey   = '585726626d7747ab8926c7d3671fe292';
class NewsService with ChangeNotifier{

  List<Article> headlines = []; 

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'Bussiness'),
    Category(FontAwesomeIcons.tv, 'Entertaiment'),
    Category(FontAwesomeIcons.addressCard, 'General'),
    Category(FontAwesomeIcons.headSideVirus, 'Health'),
    Category(FontAwesomeIcons.vials, 'Science'),
    Category(FontAwesomeIcons.volleyballBall, 'Sports'),
    Category(FontAwesomeIcons.memory, 'Technology'),

  ];

  NewsService(){

    this.getDocHeadlines();

  }

  getDocHeadlines() async {
    
    final url = '$_urlNews/top-headlines?apiKey=$_apiKey&country=us';
    final response = await http.get(url);
    final newsResponse = newsResponseFromJson(response.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();


  }

}