import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;
import 'package:twitter_api_v2/twitter_api_v2.dart';
import 'package:twitter_oauth2_pkce/twitter_oauth2_pkce.dart';

class TwitterServices {
  static late v2.TwitterApi _instance;

  static v2.TwitterApi get instance {
    try {
      return _instance;
    } catch (e) {
      throw Exception(
          "(TwitterServices) Can't get instance because the TwitterServices is not initialized yet. Consider calling [Environment.init] first");
    }
  }

/// `init` is a static function that creates a new instance of the `TwitterApi` class and assigns it to
/// the `_instance` variable
/// 
/// Args:
///   bearerToken (String): The bearer token you got from the Twitter API.
  static void init({required String bearerToken}) async {
    _instance = v2.TwitterApi(bearerToken: bearerToken);
  }

    static Future<OAuthResponse> signInWithTwitter() async {
    final oauth2 = TwitterOAuth2Client(
      clientId: dotenv.env['CLIENT_ID']!,
      clientSecret: dotenv.env['CLIENT_SECRET']!,
      redirectUri:  dotenv.env['REDIRECT_URI']!,
      customUriScheme: dotenv.env['URI_SCHEME']!,
    );

    return await oauth2.executeAuthCodeFlowWithPKCE(
      scopes: Scope.values,
    );
  }

  /// A recursive function that will keep calling itself until it gets all the user's tweets.
  static Future<TwitterResponse<List<TweetData>, TweetMeta>>? getAllUserTweets(
      {required String userId, String? nextToken, List<TweetData>? list}) async {
    log('Start searchTweet with userId $userId');

    try {
      final results = await instance.tweetsService.lookupTweets(
          userId: userId,
          maxResults: 100,
          paginationToken: nextToken,
          tweetFields: [TweetField.entities, TweetField.createdAt]);

      if (results.data.isNotEmpty) {
        list = List<TweetData>.from([...list ?? [], ...results.data]);
      }

      if (results.meta?.nextToken != null) {
        return Future.value(await getAllUserTweets(userId: userId, nextToken: results.meta?.nextToken, list: list));
      } else {
        return TwitterResponse(data: list ?? [], meta: results.meta);
      }
    } catch (e) {
      log('$e');
    }

    return TwitterResponse(data: list ?? []);
  }

/// It deletes a tweet with the given id
/// 
/// Args:
///   id (String): The id of the tweet to delete.
/// 
/// Returns:
///   A Future<bool> indicates whether the tweet was deleted successfully or not
  static Future<bool> deleteTweet({required String id}) async {
    log('Delete tweet with id $id');

    try {
      return await instance.tweetsService.destroyTweet(tweetId: id);

    } catch (e) {
      log('$e');
    }

    return false;
  }
}
