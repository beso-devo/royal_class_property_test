import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Endpoints {
  static const BASE_URL = 'https://api.escuelajs.co/api/v1';
  static const categories = '/categories';
  static const products = '/products';
}

enum ErrorCode {
  CacheError,
  UNAUTHENTICATED,
  WRONG_INPUT,
  FORBIDDEN,
  PARSE_ERROR,
  NO_INTERNET_CONNECTION,
  TIMEOUT,
  SERVER_ERROR,
  EXIST,
  NOT_EXIST_ACCOUNT,
  ERROR_ADD_BENEFICIARY,
  INSUFFICIENT_BALANCE
}

class GetOptions {
  static Options options = Options();

  static Options getOptionsWithToken(String token, {String language = ''}) {
    if (token.isNotEmpty) {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': token,
        'Accept-Language': language,
      };
    } else {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': language,
      };
    }
    return options;
  }
}
