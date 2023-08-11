import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hotelio/config/app_assets.dart';
import 'package:hotelio/config/app_colors.dart';
import 'package:hotelio/config/session.dart';
import 'package:hotelio/controller/c_users.dart';
import 'package:intl/intl.dart';

import '../config/app_format.dart';
import '../config/app_route.dart';
import '../controller/c_history.dart';
import '../model/booking.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final cHistory = Get.put(CHistory());
  final cUser = Get.put(CUsers());

  @override
  void initState() {
    cHistory.getListBooking(cUser.data.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 24),
        header(context),
        const SizedBox(height: 24),
        GetBuilder<CHistory>(builder: (_) {
          return GroupedListView<Booking, String>(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            elements: _.listBooking,
            groupBy: (element) => element.date,
            groupSeparatorBuilder: (String groupByValue) {
              String date = DateFormat('yyyy-MM-dd').format(DateTime.now()) ==
                      groupByValue
                  ? 'Today New'
                  : AppFormat.dateMonth(groupByValue);
              return Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  date,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              );
            },
            itemBuilder: (context, element) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoute.detailBooking,
                      arguments: element,
                    );
                    // Navigator.pushNamed(
                    //   context,
                    //   AppRoute.detailBooking,
                    //   arguments: bookedData,
                    // );
                  },
                  child: item(context, element),
                ),
              );
            },
            itemComparator: (item1, item2) => item1.date.compareTo(item2.date),
            order: GroupedListOrder.DESC,
          );
        }),
      ],
    );
  }

  Widget item(BuildContext context, Booking booking) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              booking.cover,
              fit: BoxFit.cover,
              height: 70,
              width: 90,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  booking.name,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  AppFormat.date(booking.date),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            decoration: BoxDecoration(
              color:
                  booking.status == 'PAID' ? AppColors.secondary : Colors.red,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 2,
            ),
            child: Text(
              booking.status,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Padding header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(16, 16, 0, 0),
                items: [
                  const PopupMenuItem(
                    value: 'logout',
                    child: Text('Logout'),
                  ),
                ],
              ).then((value) {
                if (value == 'logout') {
                  Session.clearUser();
                  Navigator.pushReplacementNamed(context, AppRoute.signIn);
                }
              });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                AppAssets.profile,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'My Booking',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
              Obx(() {
                return Text(
                  '${cHistory.listBooking.length} transactions',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
