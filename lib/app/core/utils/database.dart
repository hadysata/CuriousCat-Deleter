import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

final databaseProvider = FutureProvider<Database>((ref) async {
  return Database(await Database.setUp());
});

class Database {
  final Box userDatabase;

  Database(this.userDatabase);

  /// It initialize the database box
  ///
  /// Returns:
  ///   A Future<Box>
  static Future<Box> setUp() async {
    log('Setting up database');

    if (!kIsWeb && !Hive.isBoxOpen(DatabaseConstants.databaseName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }

    return await Hive.openBox(DatabaseConstants.databaseName);
  }

  /// It takes a user object, converts it to JSON, and stores it in the database
  ///
  /// Args:
  ///   user (UserData): The user object to be stored in the database.
  void setUser(UserData? user) async {
    log('Setting user $user');
    await userDatabase.put(DatabaseConstants.userKey, user?.toJson());
  }

  /// Getting the user from the database.
  UserData? get user {
    log('Getting user');

    final userData = userDatabase.get(DatabaseConstants.userKey);

    if (userData != null) {
      return UserData.fromJson(jsonDecode(jsonEncode(userData)) as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  /// It sets Twitter's access token in the database
  ///
  /// Args:
  ///   token (String): The access token to be stored.
  void setAccessToken(String? token) async {
    log('Setting AccessToken $token');
    await userDatabase.put(DatabaseConstants.accessTokenKey, token);
  }

  /// Getting the access token from the database.
  String? get accessToken {
    log('Getting accessToken');

    return userDatabase.get(DatabaseConstants.accessTokenKey);
  }
}

class DatabaseConstants {
  static const databaseName = 'userDatabase';

  static const userKey = 'user';
  static const accessTokenKey = 'accessToken';
}
