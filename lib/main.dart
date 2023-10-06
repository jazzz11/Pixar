import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:untitled/util/text.dart';
import 'package:untitled/widgets/toprated.dart';
import 'package:untitled/widgets/trending.dart';
import 'package:untitled/widgets/tv.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = 'ca3e83b633c90387e796d0726874c5a7';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjYTNlODNiNjMzYzkwMzg3ZTc5NmQwNzI2ODc4YzVhNyIsInN1YiI6IjY1MWMyNGVlNjVjMjZjMDBlNDFiNzBiMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mc4wum4_SZpDZw2rmRC3rSz8duY_AjK6kJSYenBtFGw';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: modified_text(
          text: 'PIXAR',
          key: UniqueKey(),
          color: Colors.white,
          size: 50,

        ),
      ),
      body: ListView(children: [
        TV(tv:tv, key:UniqueKey(),),
        TopRated(toprated: topratedmovies, key: UniqueKey(),),
        TrendingMovies(trending: trendingmovies, key: UniqueKey()),

        // Wrap your custom widgets in valid Flutter widgets
        // For example, if Tv, TopRated, and TrendingMovies are not valid,
        // you can replace them with Text widgets as placeholder
      ]),
    );
  }
}