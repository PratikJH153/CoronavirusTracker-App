class CoronaModel{
  String country;
  String countrycode;
  int newconf;
  int totalconf;
  int newdeaths;
  int totaldeaths;
  int newrec;
  int totalrec;

  CoronaModel({
    this.country,
    this.newconf,
    this.totalconf,
    this.newdeaths,
    this.newrec,
    this.totaldeaths,
    this.totalrec,
    this.countrycode
  });

}

class CoronaGlobal{

  int newconf;
  int totalconf;
  int newDeaths;
  int totalDeaths;
  int newrec;
  int totalrec;

  CoronaGlobal(
    {
      this.newconf,
      this.totalconf,
      this.newDeaths,
      this.totalDeaths,
      this.newrec,
      this.totalrec
    }
  );

}