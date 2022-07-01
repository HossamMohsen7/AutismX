import 'dart:io';

import 'package:autismx/shared/network/dio/dio_helper.dart';
import 'package:autismx/shared/network/end_point.dart' as endpoints;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AIDioHelper {
  static Future<Response<Map<String, dynamic>>> uploadImage({
    @required File imageFile,
  }) async {
    //TODO change url
    return await DioHelper.postData(
        url: "https://509d-156-201-67-186.eu.ngrok.io/upload_image",
        data: FormData.fromMap({
          "file": await MultipartFile.fromFile(imageFile.path,
              filename: imageFile.path.split('/').last)
        })).then(
      (response) {
        return response;
      },
    );
  }
}
