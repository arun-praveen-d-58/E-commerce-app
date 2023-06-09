import 'dart:convert';

import 'package:amazon_clone/constants/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
required http.Response response,
required BuildContext context,
required VoidCallback onSuccess,
}){
  switch(response.statusCode){
    case 200:
    onSuccess();
    break;
    case 400:
    showSnackBar(context, jsonDecode(response.body)['msg'].toString());
    break;

    default:
     showSnackBar(context, response.body);
  }
}