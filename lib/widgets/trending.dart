import 'package:flutter/material.dart';

import '../description.dart';
import '../util/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({required Key key, required this.trending}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          modified_text(text:'Trending Movies',size:26, key: UniqueKey(), color: Colors.white,),
          SizedBox(height:10,),
          Container(height: 270,
          child:ListView.builder(itemCount:trending.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Description(name: trending[index]['title'],
              description: trending[index]['overview'],
               bannerurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
              posterurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
              vote: trending[index]['vote_average'].toString(),
               launch_on: trending[index]['release_date'],
)));
              },
              child:
              trending[index]['title']!= null ? Container(
                  padding:EdgeInsets.all(5),
                width:250,
                child: Column(
                  children:[
                    Container(
                      width:250,
                      height:140,
                      decoration: BoxDecoration(image: DecorationImage(
                        image:NetworkImage(
                            'https://image.tmdb.org/t/p/w500'+trending[index] ['backdrop_path']
                        )
                      )),
                    ),
                    SizedBox(height:10,),
                    Container(child: modified_text(text:trending[index] ['title'] !=null?
                        trending[index]['title']:'Loading', key: UniqueKey(), color: Colors.white, size: 15,),)
                  ],
                ),
              ): Container(),
            );
          },
          ))
        ],
      ),
    );
  }
}
