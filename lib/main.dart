import 'package:curiouscat_deleter/app/auth/views/auth_wrapper.dart';
import 'package:curiouscat_deleter/app/core/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

void main() async {
/// Loading the [.env] file
  await dotenv.load();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        theme: AppThemes.main,
        debugShowCheckedModeBanner: false,
        home: const AuthWrapper(),
      );
    });
  }
}
