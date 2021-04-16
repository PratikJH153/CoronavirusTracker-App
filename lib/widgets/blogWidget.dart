import 'package:flutter/material.dart';
import '../views/articles_view.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl,title,description,url;

  BlogTile(
    {
      @required this.imageUrl,
      @required this.title,
      @required this.description,
      @required this.url
    }
  );
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.push(context,MaterialPageRoute(
          builder: (context) => ArticleViews(
            url: url,
          )
        )
      );
    },
      child: Container(
        margin: EdgeInsets.only(bottom:30),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl)),
            SizedBox(height:8),
            Text(title,style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.black87
            ),),
            SizedBox(height:8),
            Text(description,style: TextStyle(
              color:Colors.black54
            ),) 
          ],
        ),
      ),
    );
  }
}