import 'dart:async';
import 'package:http/http.dart'as http;


const baseUrl = "https://matsuya.makotia.me/v4/search";

class api {
  static Future getMenu(String type){
    var url = baseUrl + '?type='+type;
    return http.get(url);
  }
}