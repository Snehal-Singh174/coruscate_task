import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Images.dart';

class secondPage extends StatefulWidget {
  const secondPage(this.images);   //initialized constructor with the necessary parameter
  
  @required
  final Images images;   //creating object of class image

  @override
  _secondPageState createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {

  @override
  Widget build(BuildContext context) {
    return Card(          //implementing card for each data
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(  //used cached network image to display the already loaded random images
                      width: 200,
                      height: 200,
                      placeholder: (context,url)=>CircularProgressIndicator(), //progess bar uptill the images doesn't load
                      imageUrl: widget.images.url,   //showing the data which are stored in local database
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    widget.images.author,  //to display the name of author from local database
                    maxLines: 1,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}


