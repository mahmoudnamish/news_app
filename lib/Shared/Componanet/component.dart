

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget buildArticalItem (articales,context)=> InkWell(
  onTap: (){
   // Navigator.push(context, MaterialPageRoute(builder:(context) => WebView('${articales['url'] }')));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(children: [
      Container (
        width: 120, height: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: NetworkImage('${articales['urlToImage'] }'),
                fit: BoxFit.cover
            )
  
        ),
  
      ),
      SizedBox( width: 10,),
      Expanded(
        child: Container(
          height: 120,
          child: Column(
  
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
  
                child: Text(  '${articales['title'] }' ,
  
                  style:Theme.of(context).textTheme.bodyText1 ,maxLines: 3,//Importe
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 6,),
              Text('${articales['publishedAt']}',style: TextStyle(fontSize: 15,color: Colors.grey[500]))
  
            ],),
        ),
      )
  
  
    ],),
  ),
);


