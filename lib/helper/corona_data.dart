import 'dart:convert';
import '../models/corona_model.dart';
import 'package:http/http.dart' as http;

class CoronaTracker{

  List<CoronaModel> coronaTrackersList = [];
  
  Future<void> getTrackers() async{

    String url = "https://api.covid19api.com/summary";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    jsonData["Countries"].forEach((element) {
         CoronaModel coronaModel = CoronaModel(
            country: element['Country'].toString(),
            newconf: element['NewConfirmed'],
            totalconf: element["TotalConfirmed"],
            newdeaths: element["NewDeaths"],
            totaldeaths: element["TotalDeaths"],
            newrec: element["NewRecovered"],
            totalrec: element['TotalRecovered'],
            countrycode: element['CountryCode'].toString().toLowerCase()
         );
           coronaTrackersList.add(coronaModel);
       
    });

   
  }
    
}

class CoronaGlobalTracker{

  List<CoronaGlobal> coronaGlobalTrackersList = [];

  Future<void> getGlobalTrackers() async{

    String url = "https://api.covid19api.com/summary";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    
    CoronaGlobal coronaGlobalModel = new CoronaGlobal(
      newconf: jsonData['Global']['NewConfirmed'],
      totalconf: jsonData["Global"]["TotalConfirmed"],
      newDeaths: jsonData["Global"]["NewDeaths"],
      totalDeaths: jsonData["Global"]["TotalDeaths"],
      newrec: jsonData["Global"]["NewRecovered"],
      totalrec: jsonData['Global']['TotalRecovered']
    );

    coronaGlobalTrackersList.add(coronaGlobalModel);
   
  }
    
}