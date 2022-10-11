import 'package:get/get.dart';

class HashTagController extends GetxController {
  final hashtags = [].obs;
  final options = [].obs;
  final isChecked = [].obs;

  addHashtags(String value) {
    hashtags.add(value);
  }

  removeHashtags(String value) {
    hashtags.remove(value);
  }

  addOptions(String value) {
    options.add(value);
  }

  removeOptions(String value) {
    options.remove(value);
  }

  addItem(bool value) {
    isChecked.add(value);
  }

  removeItem(bool value) {
    isChecked.remove(value);
  }
}
