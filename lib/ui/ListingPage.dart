import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/ListingController.dart';
import 'CategoryCreationPage.dart';
import 'ItemsView.dart';

class ListingPage extends StatefulWidget {
  @override
  _listingPageState createState() => _listingPageState();
}

class _listingPageState extends State<ListingPage> {
  final _listingController = Get.find<ListingController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listingController.convertData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: AppBar(
                automaticallyImplyLeading: false,
                flexibleSpace: Container(color: Colors.lightBlue))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              color: Colors.lightBlue,
              child: Container(
                margin: const EdgeInsetsDirectional.only(start: 5, end: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(() => Container(
                          margin: const EdgeInsetsDirectional.only(
                              start: 10, end: 10),
                          child: _listingController.isSearch == false
                              ? TextField(
                                  controller: _listingController.cSearch.value,
                                  autofocus: true,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search here...',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  maxLines: 1,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                  onChanged: (value) {
                                    _listingController.searchFun();
                                  },
                                )
                              : const Text(
                                  "Categories Listing",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ))),
                    ),
                    InkWell(
                      onTap: () {
                        print(_listingController.isSearch.value.toString());
                        if (_listingController.isSearch.value == true) {
                          _listingController.cSearch.value.text = '';
                          _listingController.isSearch.value = false;
                          _listingController.tempData.value = [];
                          _listingController.tempData.value
                              .addAll(_listingController.data.value);
                        } else {
                          _listingController.cSearch.value.text = '';
                          _listingController.filterOption.value = '';
                          _listingController.isSearch.value = true;
                          _listingController.data.value = [];
                          _listingController.data.value
                              .addAll(_listingController.tempData.value);
                        }
                      },
                      child: Obx(
                        () => Container(
                          alignment: Alignment.center,
                          margin: EdgeInsetsDirectional.only(end: 5),
                          width: 32,
                          height: 32,
                          child: _listingController.isSearch.value == true
                              ? const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.cancel,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {},
                        child: Obx(
                          () => _listingController.isSearch.value == true
                              ? Container()
                              : PopupMenuButton(
                                  child: Container(
                                    child: const Icon(
                                      Icons.filter_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                  itemBuilder: (BuildContext bc) {
                                    return _listingController.filterList.value
                                        .map((day) => PopupMenuItem(
                                              child: Text(day),
                                              value: day,
                                            ))
                                        .toList();
                                  },
                                  onSelected: (val) {
                                    print("feattt... " + val.toString());
                                    _listingController.filterOption.value =
                                        val.toString();
                                    _listingController.searchFun();
                                  }),
                        )),
                  ],
                ),
              ),
            ),
            Obx(
              () => Expanded(
                  child: ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    ItemsView(_listingController.data[index]),
                itemCount: _listingController.data.length,
              )),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(() => CategoryCreationPage());
            }));
  }
}
