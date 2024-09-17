import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ibm_task/src/common/network/service/failure.dart';

enum HttpCallType { get, post, delete, patch }

class NetworkService {
  /// Token - Encryption -
  final client = http.Client();

  // <dynamic> == T
  Future<http.Response> makeHttpCall(
      // post - get - put ..../
      {required HttpCallType callType,
      String? url,
      String? body,
      Map<String, String>? customHeaders}) async {
    try {
      log("Request type $callType");
      log(url ?? '');
      log('Body');
      log(body.toString());
      log('Headers');
      log(json.encode(customHeaders));

      http.Response? response;

      Uri uri = Uri.parse(url!);

      /// If the header needed to be sent in different shapes
      /// So we need to add it as a parameter in this function.

      var requestHeaders = {'Content-Type': 'application/json'};

      if (callType == HttpCallType.get) {
        response =
            await client.get(uri, headers: customHeaders ?? requestHeaders);
      } else if (callType == HttpCallType.post) {
        response = await client.post(uri,
            body: body, headers: customHeaders ?? requestHeaders);
      } else if (callType == HttpCallType.patch) {
        response = await client.patch(uri,
            body: body, headers: customHeaders ?? requestHeaders);
      } else if (callType == HttpCallType.delete) {
        response = await client.delete(uri,
            body: body, headers: customHeaders ?? requestHeaders);
      }
      log("status code ${response?.statusCode}");
      if (response!.statusCode == 200) {
        log('..............API Response...............');
        log(response.body.toString());
        log('.........................................');
        return response;
      } else if (response.statusCode == 204) {
        log('..............API Response...............');
        log(response.body.toString());
        log('.........................................');
        return response;
      } else if (response.statusCode == 401) {
        log('..............API Response...............');
        log(response.body.toString());
        log('.........................................');
        return response;
      } else if (response.statusCode == 402) {
        log('..............API Response...............');
        log(response.body.toString());
        log('.........................................');
        return response;
      } else {
        log('..............API Response...............');
        log(response.statusCode.toString());
        log(response.body.toString());
        throw Failure(json.decode(response.body)["error"]["message"]);
      }
    } on SocketException {
      throw Failure('No Internet connection or fatal error');
    } on HttpException {
      throw Failure("Couldn't find the post");
    } on FormatException {
      throw Failure("Bad response format");
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> makeHttpCallWithImage(
      // post - get - put ..../
      {required HttpCallType callType,
      String? url,
      String? body,
      required List<ImageProvider?> images,
      Map<String, String>? customHeaders}) async {
    try {
      log("Request type $callType");
      log(url ?? '');
      log('Body');
      log(body.toString());
      log('Headers');
      log(json.encode(customHeaders));

      http.StreamedResponse? streamedResponse;
      http.Response? response;

      Uri uri = Uri.parse(url!);
      Map<String, String> requestObj = {"data": body.toString()};

      var requestHeaders = {'Content-Type': 'application/json'};

      if (callType == HttpCallType.post) {
        var request = http.MultipartRequest('POST', uri);

        request.headers.addAll(customHeaders ?? requestHeaders);

        for (var image in images) {
          if (image is FileImage) {
            File file = File(image.file.path);
            request.files.add(await http.MultipartFile.fromPath(
              'file',
              file.path,
            ));
          }
        }
        request.fields.addAll(requestObj);
        streamedResponse = await request.send();
      }

      final responseBodyBytes = await streamedResponse?.stream.toBytes();
      response = http.Response.bytes(
          responseBodyBytes ?? [], streamedResponse?.statusCode ?? 404,
          headers: streamedResponse?.headers ?? const {});

      if (response.statusCode == 200) {
        log('..............API Response...............');
        log(response.body.toString());
        log('.........................................');
        return response;
      } else if (response.statusCode == 204) {
        log('..............API Response...............');
        log(response.body.toString());
        log('.........................................');
        return response;
      } else if (response.statusCode == 401) {
        log('..............API Response...............');
        log(response.body.toString());
        log('.........................................');
        return response;
      } else if (response.statusCode == 402) {
        log('..............API Response...............');
        log(response.body.toString());
        log('.........................................');
        return response;
      } else {
        log('..............API Response...............');
        log(response.statusCode.toString());
        log(response.body.toString());
        throw Failure(json.decode(response.body)["error"]["message"]);
      }
    } on SocketException {
      throw Failure('No Internet connection or fatal error');
    } on HttpException {
      throw Failure("Couldn't find the post");
    } on FormatException {
      throw Failure("Bad response format");
    } catch (e) {
      rethrow;
    }
  }
}