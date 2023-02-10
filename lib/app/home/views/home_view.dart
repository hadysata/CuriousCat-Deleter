import 'package:cached_network_image/cached_network_image.dart';
import 'package:curiouscat_deleter/app/core/animations/animations/bounce.dart';
import 'package:curiouscat_deleter/app/core/utils/constants.dart';
import 'package:curiouscat_deleter/app/core/utils/database.dart';
import 'package:curiouscat_deleter/app/core/widgets/conditionary_widget/extensions/extensions.dart';
import 'package:curiouscat_deleter/app/core/widgets/rounded_card.dart';
import 'package:curiouscat_deleter/app/home/controllers/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(databaseProvider).value!.user!;

    final controller = ref.watch(homeViewProvider(context));

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          CachedNetworkImageProvider(user.profileImageUrl?.replaceFirst("_normal", "") ?? ''),
                      backgroundColor: AppColors.secondary,
                      radius: 6.w,
                    ),
                    Text(user.name),
                    Text(
                      "@${user.username}",
                      style: const TextStyle(color: AppColors.string2, fontWeight: FontWeight.w600),
                      textScaleFactor: 0.8,
                    ),
                  ],
                ).animate().fade().slide(),
                const Spacer(),
                Row(
                  children: [
                    Bounce(
                      child: Icon(Icons.delete_outlined, color: AppColors.red.withOpacity(0.7)),
                      onTap: () async {
                        await controller.value?.deleteCuriouscatTweets();

                        ref.refresh(homeViewProvider(context));
                      },
                    ).animate().fade().slide(),
                    SizedBox(width: 5.w),
                    Bounce(
                      child: Icon(Icons.logout_outlined, color: AppColors.red.withOpacity(0.7)),
                      onTap: () {
                        ref.read(databaseProvider).value?.setUser(null);
                        ref.refresh(databaseProvider);
                      },
                    ).animate().fade().slide(),
                  ],
                )
              ],
            ),
            SizedBox(height: 2.h),
            GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                childAspectRatio: 1.1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,

                // padding: const EdgeInsets.symmetric(vertical: 25),
                children: [
                  RoundedCard(
                    title: "Tweets",
                    value: '${user.publicMetrics?.tweetCount ?? 0}',
                    icon: const Icon(
                      Icons.message,
                    ),
                  ).animate().fade().slide(),
                  RoundedCard(
                    title: "curiouscat Tweets",
                    value: controller.when(
                        data: (controller) => '${controller.curiouscatTweetsCount}',
                        error: (_, __) => 'Error',
                        loading: () => 'Loading'),
                    iconBackgroundColor: AppColors.blue,
                    icon: const Icon(
                      Icons.message,
                    ),
                  ).animate().fade().slide(),
                  RoundedCard(
                    title: "Followers",
                    value: '${user.publicMetrics?.followersCount ?? 0}',
                    iconBackgroundColor: AppColors.green,
                    icon: const Icon(
                      Icons.person_add_alt_1_rounded,
                    ),
                  ).animate().fade().slide(),
                  RoundedCard(
                    title: "Following",
                    value: '${user.publicMetrics?.followingCount ?? 0}',
                    iconBackgroundColor: AppColors.purple,
                    icon: const Icon(
                      Icons.person_sharp,
                    ),
                  ).animate().fade().slide(),
                ]),
            controller.when(error: ((error, stackTrace) {
              return const Center(child: Text('Error loading curiouscat tweets'));
            }), loading: () {
              return const Center(child: Text('Loading tweets'));
            }, data: (controller) {
              final curiouscatTweets = controller.curiouscatTweets;

              return curiouscatTweets.showWhen(
                  empty: const Center(child: Text("You don't have any curiouscat tweets 🫡")),
                  notEmpty: SizedBox(
                    height: 32.h,
                    child: ListView.builder(
                        // padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                        itemCount: curiouscatTweets.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                controller.curiouscatTweets.removeWhere((tweet) => curiouscatTweets[index] == tweet);
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.all(4.sp),
                              child: Container(
                                decoration: DesignConstants.containerDecoration,
                                child: Padding(
                                  padding: EdgeInsets.all(15.sp),
                                  child: Text(curiouscatTweets[index].text),
                                ),
                              ),
                            ).animate().fade().scale().slide(),
                          );
                        }),
                  ));
            })
          ],
        ),
      ),
    );
  }
}
