import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';

class InterceptorService implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    debugPrint(data.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    debugPrint(data.toString());
    return data;
  }
}