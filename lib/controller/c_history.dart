import 'package:get/get.dart';

import '../model/booking.dart';
import '../source/booking_source.dart';

class CHistory extends GetxController {
  final _listBooking = <Booking>[].obs;
  // ignore: invalid_use_of_protected_member
  List<Booking> get listBooking => _listBooking.value;

  getListBooking(String id) async {
    _listBooking.value = await BookingSource.getHistory(id);
    update();
  }
}
