import 'dart:convert';
import '../models/news_model.dart';
import 'package:http/http.dart' as http;

class News {

  List<NewsModel> news = [];

  
  Future<void> getNews() async{
    String url = "http://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=b2251b383fea4fdab965242711436624";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element) {

          NewsModel newsModel = NewsModel(
            title: element['title'].toString(),
            author: element['author'].toString(),
            description: element['description'].toString(),
            url: element['url'].toString(),
            urlToImage: element['urlToImage'].toString(),
            content: element['content'].toString(),
          );
          news.add(newsModel);
          
        
      });
    }

  }

}
