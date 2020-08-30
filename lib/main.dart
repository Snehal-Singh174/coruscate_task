import 'package:flutter/material.dart';
import 'package:practical_task_coruscate/Images.dart';
import 'package:practical_task_coruscate/services.dart';
import 'secondpage.dart';
import 'dart:math';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //declared a variable for page number
  int i;

  ScrollController scrollController=ScrollController(); //for controlling scroller

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener((){
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent)
        {
          //If we are at the bottom of the page
          //On Scrolling new page with 10 new images will be fetched
          i = Random().nextInt(100);  // for random images we are taking random page
          setState(() {
                //setting the set so that on scrolling new pages should appear
          });
        }
    });
  }

  @override
  void dispose(){
    scrollController.dispose();  //to clear the memory occupied
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  //to remove the dubug mode banner
      theme: ThemeData(
        primaryColor: Colors.black, //we can also use dynamic_theme or dark mode for design
      ),
      home: Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          title: Image.asset("assets/coruscate_logo.png", height: 100, width:200), //logo to appbar
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: FutureBuilder<List<Images>>(
                future: Services.getPhotos(i),  //fetching images from json by passing random page number
                builder: (context,snapshot){
                  if(snapshot.hasError)
                    {
                      return Text('Error ${snapshot.error}'); //if there is error in fetching data then this condition will be performed
                    }
                  if(snapshot.hasData){
                    return Padding(
                      padding: EdgeInsets.all(5.0),
                      child: GridView.count(          //grid view for showing 2 column containing images
                        controller: scrollController, //for controlling the scroller
                        crossAxisCount: 2,            //for two column in single row
                        childAspectRatio: 1.0,      //width by height ratio
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                        children: snapshot.data.map((images){
                          return GridTile(
                            child: secondPage(images),   //calling another page in which single images decoration is implemented
                          );
                        },).toList(),
                      ),
                    );

                  }
                  return Center(child: CircularProgressIndicator(),);   //to show progess bar uptill datas are not fetched
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
