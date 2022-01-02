import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:play_on/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class NetworkHelper {
  static Future<Map<String, dynamic>> getData(
    Dio dio, {
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    Response response = await dio.get(endPoint, queryParameters: body);
    Map<String, dynamic> data = jsonDecode(response.toString());
    return data;
  }

  static Future launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      String msg = Strings.couldNotLaunch + " " + url;
      throw msg;
    }
  }
}
