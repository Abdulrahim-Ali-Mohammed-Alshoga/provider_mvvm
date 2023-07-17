// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    // dio error so its an error from response of the API or from dio itself
    if (error is DioError) {
      if (error.toString().contains('SocketException')) {
        failure = Failure(DataSource.NO_INTERNET_CONNECTION.code,
            DataSource.NO_INTERNET_CONNECTION.message);
      }
      else {
        failure = _handleError(error);
      }
    } else {
      // default error
     // debugPrint('444444');
      failure = Failure(DataSource.DEFAULT.code, DataSource.DEFAULT.message);
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return Failure(
          DataSource.CONNECT_TIMEOUT.code, DataSource.CONNECT_TIMEOUT.message);
    case DioErrorType.sendTimeout:
      return Failure(
          DataSource.SEND_TIMEOUT.code, DataSource.SEND_TIMEOUT.message);
    case DioErrorType.receiveTimeout:
      return Failure(
          DataSource.RECEIVE_TIMEOUT.code, DataSource.RECEIVE_TIMEOUT.message);
    case DioErrorType.response:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? "");
      } else {
        return Failure(DataSource.DEFAULT.code, DataSource.DEFAULT.message);
      }
    case DioErrorType.cancel:
      return Failure(DataSource.CANCEL.code, DataSource.CANCEL.message);
    case DioErrorType.other:
      return Failure(DataSource.DEFAULT.code, DataSource.DEFAULT.message);
  }
}

enum DataSource {
  CONNECT_TIMEOUT(message: 'Time out error, Try again later', code: -1),
  CANCEL(message: 'Request was cancelled, Try again later', code: -2),
  RECEIVE_TIMEOUT(message: 'Time out error, Try again later', code: -3),
  SEND_TIMEOUT(message: 'Time out error, Try again later', code: -4),
  CACHE_ERROR(message: 'Cache error, Try again later', code: -5),
  NO_INTERNET_CONNECTION(
      message: 'Please check your internet connection', code: -6),
  DEFAULT(message: 'Some thing went wrong, Try again later', code: -7);

  const DataSource({required this.message, required this.code});

  final int code;
  final String message;
}
