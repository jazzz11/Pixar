import 'package:flutter/material.dart';

import '../description.dart';
import '../util/text.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({required Key key, required this.tv}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          modified_text(text:'Popular Tv Shows',size:26, key: UniqueKey(), color: Colors.white,),
          SizedBox(height:10,),
          Container(height: 270,
              child:ListView.builder(itemCount:tv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap:(){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Description(name: tv[index]['original_name'],
                          description: tv[index]['overview'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path'],
                          vote: tv[index]['vote_average'].toString(),
                          launch_on: tv[index]['release_date'],
                        )));
                      },
                      child:tv[index]['title']!= null ?Container(
                          padding:EdgeInsets.all(5),
                          width:250,
                          child: Column(
                              children:[
                                Container(

                                  width:250,
                                  height:140,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                      image:NetworkImage(
                                          'https://image.tmdb.org/t/p/w500'+tv[index] ['backdrop_path']
                                      ), fit:BoxFit.cover
                                  )),
                                ),
                                SizedBox(height:10,),
                                Container(child: modified_text(text:tv[index] ['original_name'] !=null?
                                tv[index]['original_name']:'Loading', key: UniqueKey(), color: Colors.white, size: 15,),)
                              ]
                          )
                      ): Container(),
                  );
                },
              ))
        ],
      ),
    );
  }
}
