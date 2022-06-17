import 'package:category_listing/ui/ListingPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/ListingController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final ListingController _listingController = Get.put(ListingController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListingPage(),
    );
  }
}
