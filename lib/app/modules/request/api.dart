import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';

class MarvelApi {
  final String _publicKey = '54752cd492ec16db636b229dd2239f8b';
  final String _privateKey = '42e5a60d482d09bcdb1295caaa334772e9e59d60';
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://gateway.marvel.com/v1/public/',
  ));
  final String _limit = '50';

  Future<Map<String, dynamic>> getCharacters() async {
    final Map<String, String> queryParameters = _buildQueryParameters();
    final Response response = await _dio.get('characters',
        queryParameters: queryParameters);
    return response.data;
  }

  Future<Map<String, dynamic>> getCharacterById(int id) async {
    final Map<String, String> queryParameters = _buildQueryParameters();
    final Response response = await _dio.get('characters/$id',
        queryParameters: queryParameters);
    return response.data;
  }

  Map<String, String> _buildQueryParameters() {
    final DateTime now = DateTime.now();
    final String timestamp = now.millisecondsSinceEpoch.toString();
    final String hash =
    _generateMd5('$timestamp$_privateKey$_publicKey').toString();

    return {
      'apikey': _publicKey,
      'ts': timestamp,
      'hash': hash,
      'limit': _limit,
      'offset': _limit,
    };
  }

  String _generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}
