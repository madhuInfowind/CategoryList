import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/ListingController.dart';
import '../resource/utils.dart';

class CategoryCreationPage extends StatelessWidget {
  final _listingController = Get.find<ListingController>();

  CategoryCreationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Category"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsetsDirectional.only(start: 8, end: 8, top: 30),
                padding: const EdgeInsetsDirectional.only(
                    start: 5, end: 5, top: 10, bottom: 10),
                child: TextField(
                  controller: _listingController.categoryEnglishName.value,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Category Name in English',
                  ),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(start: 8, end: 8, top: 10),
                padding: const EdgeInsetsDirectional.only(
                    start: 5, end: 5, top: 10, bottom: 10),
                child: TextField(
                  controller: _listingController.categoryHindiName.value,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Category Name in Hindi',
                  ),
                )),
            Container(
                margin: const EdgeInsetsDirectional.only(start: 8, end: 8, top: 10),
                padding: const EdgeInsetsDirectional.only(
                    start: 5, end: 5, top: 10, bottom: 10),
                child: TextField(
                  controller: _listingController.cDescription.value,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Description',
                  ),
                )),
            Container(
              margin: EdgeInsetsDirectional.only(start: 20, end: 20),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "featured",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => Container(
                          alignment: Alignment.centerRight,
                          child: Switch(
                            onChanged: _listingController.toggleSwitch,
                            value: _listingController.isSwitched.value,
                            activeColor: Colors.blueAccent,
                            activeTrackColor: Colors.black12,
                            inactiveThumbColor: Colors.grey,
                            inactiveTrackColor: Colors.black12,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                _listingController.pickImage();
              },
              child: Obx(
                () => Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.black12),
                    margin:
                        const EdgeInsetsDirectional.only(start: 15, end: 15, top: 15),
                    padding: const EdgeInsetsDirectional.only(
                        start: 10, end: 10, top: 15, bottom: 15),
                    child: Text((_listingController.imagePath.value == "" ||
                            _listingController.imagePath.value.isEmpty ||
                            _listingController.imagePath.value == null)
                        ? "Upload Pick from gallery"
                        : _listingController.imagePath.value)),
              ),
            ),
            InkWell(
                onTap: () {
                  if (_listingController.categoryEnglishName.value.text
                      .trim()
                      .isEmpty) {
                    showToast("Enter Category Name in English");
                  } else if (_listingController.categoryHindiName.value.text
                      .trim()
                      .isEmpty) {
                    showToast("Enter Category Name in Hindi");
                  } else if (_listingController.cDescription.value.text
                      .trim()
                      .isEmpty) {
                    showToast("Enter Description");
                  }else if (_listingController.imagePath.value.isEmpty) {
                    showToast("Select Image");
                  } else {
                    _listingController.addCategory(context);
                  }

                },
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    margin:
                        const EdgeInsetsDirectional.only(start: 15, end: 15, top: 25),
                    padding: const EdgeInsetsDirectional.only(
                        start: 20, end: 20, top: 10, bottom: 10),
                    child: const Text(
                      "Add Category",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    )))
          ],
        ),
      ),
    );
  }
}
