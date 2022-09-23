import 'dart:developer';

import 'package:curiouscat_deleter/app/auth/controllers/login_controller.dart';
import 'package:curiouscat_deleter/app/auth/views/auth_wrapper.dart';
import 'package:curiouscat_deleter/app/core/animations/animations/show_up.dart';
import 'package:curiouscat_deleter/app/core/utils/constants.dart';
import 'package:curiouscat_deleter/app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome 👋",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: AppColors.string2,
              ),
            ),
            SizedBox(height: 2.h),
            const Text(
              "Please login with your twitter account to start!",
              textScaleFactor: 1.3,
            ),
            ShowUp(
              child: Lottie.asset(
                AppAssets.loginAnimation,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: CustomButton(
                text: "Login",
                onPressed: (() async {
                  try {
                    await pr.show();
                    await LoginController.setupTwitter(ref);
                  } catch (e) {
                    log('$e');
                  }
                  await pr.hide();
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
