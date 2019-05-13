import 'dart:async';
import 'package:http/http.dart'as http;


const baseUrl = "https://matsuya.makotia.me/v4/search";

class api {
  static Future getMenu(){
    var url = baseUrl + '';
    return http.get(url);
  }
}