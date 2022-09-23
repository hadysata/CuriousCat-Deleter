import 'package:curiouscat_deleter/app/core/utils/database.dart';
import 'package:curiouscat_deleter/app/twitter/services/twitter_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

class LoginController {
  /// It signs in with Twitter, sets the access token in the database, initializes the Twitter services,
  /// and sets the user in the database
  static Future<void> setupTwitter(WidgetRef ref) async {
    final auth = await TwitterServices.signInWithTwitter();

    final database = ref.read(databaseProvider).value;

    database?.setAccessToken(auth.accessToken);

    TwitterServices.init(bearerToken: database!.accessToken!);

    final user = (await TwitterServices.instance.usersService.lookupMe(userFields: UserField.values)).data;

    ref.read(databaseProvider).value?.setUser(user);

    ref.refresh(databaseProvider);
  }
}
