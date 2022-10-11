import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mevolve_hashtag/base/constants/colors.dart';
import 'package:mevolve_hashtag/base/controllers/hashtag_controller.dart';
import 'package:mevolve_hashtag/extensions/util_extensions.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  void initState() {
    super.initState();
  }

  //when there are no hashtags in the controller list
  Widget noHashtags() {
    context.hideKeyboard();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Divider(
          color: AppColors.secondary,
          thickness: 6,
          height: 4,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 57,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/quotes@1x.png"),
                20.verticalSpace(),
                const Text(
                  "You shouldn’t focus on why you can’t do something, which is what most people do. you should focus on why perhaps, you could be one of the exceptions.",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.gray,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                32.verticalSpace(),
                const Text(
                  "Steve Case",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.gray,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // context.hideKeyboard();
    FocusScope.of(context).unfocus();
    final HashTagController controller =
        Get.put(HashTagController()); //injecting the controller
    return Obx(
      () => Container(
        child: controller.hashtags.isNotEmpty
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      controller.hashtags[index],
                    ),
                  );
                },
                itemCount: controller.hashtags.length,
              )
            : noHashtags(),
      ),
    );
  }
}
