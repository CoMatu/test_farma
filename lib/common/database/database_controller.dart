import 'package:get/get.dart';
import 'package:isar/isar.dart';

class DbController extends GetxController {
  Isar? isar;

  @override
  void onInit() async {
    isar ??= await Isar.open(
      [],
    );
    super.onInit();
  }
}
