import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mevolve_hashtag/base/constants/colors.dart';
import 'package:mevolve_hashtag/base/controllers/hashtag_controller.dart';
import 'package:mevolve_hashtag/extensions/util_extensions.dart';

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final TextEditingController optionController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  bool status = false;

  //Ui for swipe left to delete
  Widget deleteOptionBackground() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.all(10),
      color: Colors.red,
      child: const Icon(
        Icons.delete,
        color: AppColors.white,
      ),
    );
  }

  Widget noOptions() {
    final HashTagController controller = Get.put(HashTagController());
    return Obx(
      () => SizedBox(
        height: MediaQuery.of(context).size.height * 0.78,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = controller.options[index];

                        return Dismissible(
                          key: Key(item),
                          onDismissed: (direction) {
                            controller.options.removeAt(index);
                            setState(() {
                              controller.isChecked.removeAt(index);
                            });
                          },
                          background: deleteOptionBackground(),
                          child: CheckboxListTile(
                            title: Text(
                              controller.options[index].toString(),
                            ),
                            value: controller.isChecked[index],
                            onChanged: (value) {
                              setState(
                                () {
                                  controller.isChecked[index] = value!;
                                },
                              );
                            },
                          ),
                        );
                      },
                      itemCount: controller.options.length,
                    ),
                  ),
                  Visibility(
                    visible: controller.options.isNotEmpty,
                    child: const Text(
                      "Swipe left to delete",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.45,
                            child: Scaffold(
                              body: TextFormField(
                                controller: optionController,
                                focusNode: focusNode,
                                autofocus: true,
                                decoration: InputDecoration(
                                  prefix: const Text("# "),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                    ),
                                  ),
                                  suffix: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        controller.isChecked.add(false);
                                      });
                                      controller.addOptions(
                                          "# ${optionController.text}");

                                      context.hideKeyboard();
                                      optionController.clear();
                                      pop();
                                    },
                                    child: Container(
                                      height: 32,
                                      width: 32,
                                      decoration: const BoxDecoration(
                                        color: AppColors.primary,
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.primary,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  listOfOptions() {
    final HashTagController controller = Get.put(HashTagController());
    return Obx(
      () => SizedBox(
        height: MediaQuery.of(context).size.height * 0.78,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = controller.options[index];

                        return Dismissible(
                          key: Key(item),
                          onDismissed: (direction) {
                            controller.options.removeAt(index);
                            setState(() {
                              controller.isChecked.removeAt(index);
                            });
                          },
                          background: deleteOptionBackground(),
                          child: CheckboxListTile(
                            title: Text(
                              controller.options[index].toString(),
                            ),
                            value: controller.isChecked[index],
                            onChanged: (value) {
                              setState(
                                () {
                                  controller.isChecked[index] = value!;
                                },
                              );
                            },
                          ),
                        );
                      },
                      itemCount: controller.options.length,
                    ),
                  ),
                  Visibility(
                    visible: controller.options.isNotEmpty,
                    child: const Text(
                      "Swipe left to delete",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.45,
                            child: Scaffold(
                              body: TextFormField(
                                controller: optionController,
                                focusNode: focusNode,
                                autofocus: true,
                                decoration: InputDecoration(
                                  prefix: const Text("# "),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                    ),
                                  ),
                                  suffix: GestureDetector(
                                    onTap: () {
                                      debugPrint(
                                        controller.options
                                            .contains(
                                                "# ${optionController.text}")
                                            .toString(),
                                      );
                                      if (controller.options.contains(
                                          "# ${optionController.text}")) {
                                        return;
                                      } else {
                                        setState(
                                          () {
                                            controller.isChecked.add(false);
                                          },
                                        );
                                        controller.addOptions(
                                            "# ${optionController.text}");
                                      }
                                      context.hideKeyboard();
                                      optionController.clear();
                                      pop();
                                    },
                                    child: Container(
                                      height: 32,
                                      width: 32,
                                      decoration: const BoxDecoration(
                                        color: AppColors.primary,
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.primary,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.hideKeyboard();
    final HashTagController controller = Get.put(HashTagController());
    controller.options.every(
      (element) {
        controller.addItem(false);
        return true;
      },
    );
    return Obx(
      () => Column(
        children: [
          Container(
            height: 51,
            color: AppColors.primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hashtag",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      for (int i = 0; i < controller.options.length; i++) {
                        if (controller.isChecked[i] &&
                            !controller.hashtags
                                .contains(controller.options[i])) {
                          controller.hashtags.add(controller.options[i]);
                        }
                      }
                      pop();
                    },
                    child: const Icon(
                      Icons.check,
                      color: AppColors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          controller.options.isEmpty ? noOptions() : listOfOptions(),
        ],
      ),
    );
  }
}
