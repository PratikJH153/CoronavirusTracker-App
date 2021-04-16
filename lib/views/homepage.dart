import 'dart:async';
import '../models/news_model.dart';
import 'package:flutter/material.dart';
import '../helper/corona_data.dart';
import '../models/corona_model.dart';
import 'package:intl/intl.dart';
import '../widgets/globalWidget.dart';
import '../widgets/countryWidget.dart';
import '../helper/news_data.dart';
import '../widgets/blogWidget.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<CoronaModel> coronaDetails =  new List<CoronaModel>();
  List<CoronaGlobal> coronaGlobalDetails = new List<CoronaGlobal>();
  List<NewsModel> articles = new List<NewsModel>();
  
  bool _loading1 = true;
  bool _loading2 = true;
  bool _loading3 = true;
  // bool _loading4 = true;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  // Scaffold key!
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // You can put any thing you like, like refetching posts or data from internet
  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();

    Timer(const Duration(milliseconds: 300), () {
      completer.complete();
    });

    return completer.future.then<void>((_) {
      _scaffoldKey.currentState?.showSnackBar(SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
              label: 'RETRY',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              }
            )
          )
        );
      }
    );
  }


  @override
  void initState() {
    super.initState();
    getGlobaltrackers();
    getToptrackers();
    getNews();
    // getOthertrackers();
  }

  getToptrackers() async{
    CoronaTracker coronaTracker = CoronaTracker();
    await coronaTracker.getTrackers();
    coronaDetails = coronaTracker.coronaTrackersList;
    coronaDetails.sort((b,a)=>a.totalconf.compareTo(b.totalconf));
    setState(() {
      _loading2 = false;
    });
  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading3 = false;
    });
  }
  
  getGlobaltrackers() async{
    CoronaGlobalTracker coronaGlobalTracker = CoronaGlobalTracker();
    await coronaGlobalTracker.getGlobalTrackers();
    coronaGlobalDetails = coronaGlobalTracker.coronaGlobalTrackersList;
    setState(() {
      _loading1 = false;
    });
  }

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
            children:[
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
      body: LiquidPullToRefresh(
              color: Colors.white,
              backgroundColor: Colors.red[400],
              key: _refreshIndicatorKey,
              onRefresh: _handleRefresh,
              showChildOpacityTransition: true,
              child: ListView(
                children: <Widget>[
                  SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal:20,vertical:10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        
                        SizedBox(height:10),
                        Text(
                          DateFormat.MMMMEEEEd().format(DateTime.now()).toUpperCase(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(height:5),
                        Text('GLOBAL',style: TextStyle(color:Colors.grey[800],fontWeight: FontWeight.bold,fontSize:24),),
                          SizedBox(height:20),
                          _loading1?Center(
                            child:CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
                            )
                          ):
                          Container(
                            child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: coronaGlobalDetails.length,
                            itemBuilder: (context,index){
                              return GlobalWidget(
                                  totalConfirmed: coronaGlobalDetails[index].totalconf,
                                  totalRec: coronaGlobalDetails[index].totalrec,
                                  totalDeaths: coronaGlobalDetails[index].totalDeaths,
                          );                                  
                       }
                    ),
                 ),
                 SizedBox(height:30),
                 Text('TOP COUNTRIES',style: TextStyle(color:Colors.grey[800],fontWeight: FontWeight.w500,fontSize:20),),
                 SizedBox(height:10),
                 _loading2?Center(
                            child:CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
                            )
                          ):Container(
                      height: 220,
                      child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (context,index){
                                  return CountryWidget(
                                    country: coronaDetails[index].country,
                                    totalconf:  coronaDetails[index].totalconf,
                                    totalrec: coronaDetails[index].totalrec,
                                    totaldeaths: coronaDetails[index].totaldeaths,
                                    newconf: coronaDetails[index].newconf,
                                    newrec: coronaDetails[index].newrec,
                                    newdeaths: coronaDetails[index].newdeaths,
                                    image: "https://www.countryflags.io/${coronaDetails[index].countrycode}/shiny/64.png",
                          );                              
                       }
                    ),
                 ),
                 SizedBox(height:30),
                 Text('OTHER COUNTRIES',style: TextStyle(color:Colors.grey[800],fontWeight: FontWeight.w500,fontSize:20),),
                 SizedBox(height:10),
                 _loading2?Center(
                            child:CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal),
                            )
                          ):Container(
                      height: 220,
                      child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (context,index){
                                  return CountryWidget(
                                    country: coronaDetails[index+20].country,
                                    totalconf:  coronaDetails[index+20].totalconf,
                                    totalrec: coronaDetails[index+20].totalrec,
                                    totaldeaths: coronaDetails[index+20].totaldeaths,
                                    newconf: coronaDetails[index+20].newconf,
                                    newrec: coronaDetails[index+20].newrec,
                                    newdeaths: coronaDetails[index+20].newdeaths,
                                    image: "https://www.countryflags.io/${coronaDetails[index+20].countrycode}/shiny/64.png",
                          );                              
                       }
                    ),
                 ),
                 SizedBox(height:30),
                
                 Text('NEWS ON CORONAVIRUS',style: TextStyle(color:Colors.grey[800],fontWeight: FontWeight.w500,fontSize:20),),
                 SizedBox(height:30),
                 _loading3?Center(
                            child:CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                            )
                          ):Container(
                    padding: EdgeInsets.only(top:15),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: articles.length,
                      itemBuilder: (context,index){
                        return BlogTile(
                          imageUrl: articles[index].urlToImage, 
                          title: articles[index].title, 
                          description: articles[index].description,
                          url:articles[index].url
                        );
                      }
                    ),
                  )
             ],
           ),
         )
        ),

                ], 
         ),
      ) 
  );
}
}

