import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practical_task_coruscate/Images.dart';

class Services{
  //url of json from where images are to be loaded
  static const String url = "https://picsum.photos/v2/list";

  //to load images from json used Future method
  static Future<List<Images>> getPhotos(int page) async {

    try{

      //parsing the url with specifying page number and default limit is 10
      final response = await http.get(Uri.parse("$url?page=$page&limit=10"));

      if(response.statusCode == 200) {
        //calling the method to map images
        List<Images> list = parsePhotos(response.body);
        return list;
        }else{
          throw Exception("Error");
          }
      }catch(e){
        print(e); //to print the error occurred during loading of images
      }
  }

  static List<Images> parsePhotos(String responseBody) {
    //decoding json data
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    //parsing and mapping images from json
    return parsed.map<Images>((json)=> Images.fromJson(json)).toList();
  }
}