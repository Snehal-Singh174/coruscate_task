class Images {  //model to store datas from json to image model
  String id;
  String author;
  String url;

  Images({this.id,this.author,this.url});

  factory Images.fromJson(Map<String , dynamic> json){
    return Images(
      id: json['id'],               //fetching value of id from json
      author: json['author'],       //fetching value of author from json
      url: json['download_url'],    //fetching value of download_url from json
    );
  }

}