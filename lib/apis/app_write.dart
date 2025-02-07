import 'dart:developer';

import 'package:appwrite/appwrite.dart';

import '../helper/global.dart';

class AppWrite {
  static final _client = Client();
  static final _database = Databases(_client);

  static void init() {
    //Client _client = Client();
    _client.setProject('your id');
    getApiKey();
  }

  static Future<String> getApiKey() async {
    try {
      final d = await _database.getDocument(
          databaseId: 'your id',
          collectionId: 'ApiKey',
          documentId: 'GeminiApiKey');

      apiKey = d.data['apiKey'];
      log(apiKey);
      return apiKey;
    } catch (e) {
      log('$e');
      return '';
    }
  }
} 
