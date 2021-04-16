import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleViews extends StatefulWidget {
  
  final String url;
  ArticleViews({this.url});

  @override
  _ArticleViewsState createState() => _ArticleViewsState();
}

class _ArticleViewsState extends State<ArticleViews> {
  
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color:Colors.black87),
        elevation: 0,
        centerTitle: true,
        title: RichText(
          text:TextSpan(
            children: [
              TextSpan(
                text: 'Corona',
                style: TextStyle(
                  color:Colors.red[600],
                  fontSize: 22,
                  fontWeight: FontWeight.w700,    
                )
              ),
              TextSpan(
                text:'Tracker',
                style:TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87
                )
              )
            ]
          )
        ),
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.url,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}