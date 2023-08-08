import 'package:get/get.dart';
import 'package:hotelio/model/user.dart';

class CUsers extends GetxController {
  final _data = User().obs;
  User get data => _data.value;
  setData(User n) => _data.value = n;
}
