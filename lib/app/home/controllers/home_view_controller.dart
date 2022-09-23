import 'package:curiouscat_deleter/app/core/widgets/progress_dialog.dart';
import 'package:curiouscat_deleter/app/curiouscat/services/curiouscat_services.dart';
import 'package:curiouscat_deleter/app/twitter/services/twitter_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

final homeViewProvider = FutureProvider.family<HomeViewController, BuildContext>((ref, context) async {
  final tweets = await CuriouscatServices.getCuriouscatTweets();

  return HomeViewController(curiouscatTweets: tweets, context: context, ref: ref);
});

class HomeViewController {
  final BuildContext context;
  final FutureProviderRef<HomeViewController> ref;
  List<TweetData> curiouscatTweets;

  HomeViewController({required this.context, required this.ref, required this.curiouscatTweets});

  Future<void> deleteCuriouscatTweets() async {
    final pr = ProgressDialog(context);
    Duration waitDuration;

    pr.show();

    for (final tweet in curiouscatTweets) {
      final isDeleted = await TwitterServices.deleteTweet(id: tweet.id);

      if (isDeleted) {
        waitDuration = const Duration(milliseconds: 500);
      } else {
        waitDuration = const Duration(minutes: 15);
      }

      await Future.delayed(waitDuration, () {});
    }

    pr.hide();
  }

  int get curiouscatTweetsCount {
    return curiouscatTweets.length;
  }
}
