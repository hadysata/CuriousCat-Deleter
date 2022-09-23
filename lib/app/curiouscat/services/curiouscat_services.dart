import 'dart:developer';

import 'package:curiouscat_deleter/app/core/utils/database.dart';
import 'package:curiouscat_deleter/app/twitter/services/twitter_service.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

class CuriouscatServices {
/// Get all tweets from the current user, then filter out any tweets that contain a curiouscat
/// link
/// 
/// Returns:
///   A list of TweetData objects
  static Future<List<TweetData>> getCuriouscatTweets() async {
    log('Start getCuriouscatTweets');

    final database = Database(await Database.setUp());

    final currentUserId = database.user!.id;

    final allTweets = await TwitterServices.getAllUserTweets(userId: currentUserId);

    List<TweetData> curiouscatTweets = [];

    // ignore: avoid_function_literals_in_foreach_calls
    allTweets?.data.forEach((tweet) {
      final expandedUrl = tweet.entities?.urls?.last.expandedUrl ?? '';

      if (expandedUrl.contains('curiouscat')) {
        curiouscatTweets.add(tweet);
      }
    });

    // Remove any duplicates
    curiouscatTweets = curiouscatTweets.toSet().toList();

    log('Finished getCuriouscatTweets with ${curiouscatTweets.length} tweet');

    return curiouscatTweets;
  }
}
