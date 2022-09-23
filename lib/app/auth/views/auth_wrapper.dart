import 'dart:developer';

import 'package:curiouscat_deleter/app/auth/views/loading_view.dart';
import 'package:curiouscat_deleter/app/auth/views/login_view.dart';
import 'package:curiouscat_deleter/app/core/utils/database.dart';
import 'package:curiouscat_deleter/app/core/widgets/progress_dialog.dart';
import 'package:curiouscat_deleter/app/home/views/home_view.dart';
import 'package:curiouscat_deleter/app/twitter/services/twitter_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

late ProgressDialog pr;

class AuthWrapper extends ConsumerStatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  ConsumerState<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends ConsumerState<AuthWrapper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context);

    final database = ref.watch(databaseProvider);

    return database.when(data: ((database) {
      if (database.user?.id != null) {
        TwitterServices.init(bearerToken: database.accessToken ?? '');

        return const HomeView();
      } else {
        log("User is not signed in");

        return const LoginView();
      }
    }), error: (error, __) {
      log('$error');

      return const LoginView();
    }, loading: () {
      return const LoadingView();
    });
  }
}
