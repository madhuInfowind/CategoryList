import 'package:category_listing/Model/LocalData.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../Model/DataModel.dart';
import '../Model/Name.dart';
import 'package:flutter/material.dart';

class ListingController extends GetxController {

  RxList data = [].obs;
  RxList tempData = [].obs;
  late List<DataModel> childrenData;
  late DataModel parentData;

  Rx<TextEditingController> cSearch = TextEditingController().obs;
  Rx<FocusNode> fSeach = FocusNode().obs;
  RxBool isSearch = true.obs;

  RxList<String> filterList = ['Featured', 'Non-Featured'].obs;
  RxString filterOption = ''.obs;

  RxString imagePath = "".obs;
  RxBool isSwitched = false.obs;

  Rx<TextEditingController> categoryEnglishName = TextEditingController().obs;
  Rx<TextEditingController> categoryHindiName = TextEditingController().obs;
  Rx<TextEditingController> cDescription = TextEditingController().obs;
  Rx<TextEditingController> cFeatures = TextEditingController().obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    data.value = [];
  }

  Future convertData() async {
    for (int i = 0; i < LocalData['data']!.length; i++) {
      childrenData = [];
      if (LocalData['data']![i]['parentID'] == "0") {
        parentData = DataModel.fromJson(LocalData['data']![i]);
        String categoryId = LocalData['data']![i]['categoryId'].toString();
        for (int j = 0; j < LocalData['data']!.length; j++) {
          if (LocalData['data']![j]['parentID'] == categoryId) {
            childrenData.add(DataModel.fromJson(LocalData['data']![j]));
          }
        }
        childrenData.sort((a, b) {
          return a.name![0].value!
              .toLowerCase()
              .compareTo(b.name![0].value!.toLowerCase().toLowerCase());
        });

        data.add(DataModel(
            categoryId: parentData.categoryId,
            name: parentData.name,
            slug: parentData.slug,
            description: parentData.description,
            parentID: parentData.parentID,
            type: parentData.type,
            attributeSet: parentData.attributeSet,
            categoryNumber: parentData.categoryNumber,
            level: parentData.level,
            featured: parentData.featured,
            icon: parentData.icon,
            image: parentData.image,
            status: parentData.status,
            createDate: parentData.createDate,
            children: childrenData));

        data.sort((a, b) {
          return a.name[0].value
              .toLowerCase()
              .compareTo(b.name[0].value.toLowerCase().toLowerCase());
        });
      }
    }
    return data;
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      imagePath.value = image.path;
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void toggleSwitch(bool value) {
    if (isSwitched.value == false) {
      isSwitched.value = true;
    } else {
      isSwitched.value = false;
    }
  }

  void addCategory(BuildContext context) {
    List<Name> name = [];
    name.insert(
        0, Name(id: '', language: 'en', value: categoryEnglishName.value.text));
    name.insert(
        1, Name(id: '', language: 'en', value: categoryHindiName.value.text));

    List<dynamic> images = [];
    images.add(imagePath.value);

    data.add(DataModel(
        categoryId: new DateTime.now().microsecondsSinceEpoch.toString(),
        name: name,
        description: cDescription.value.text.toString(),
        parentID: "0",
        featured: isSwitched.value,
        image: images,
        children: [],
        isCustom: true));

    data.sort((a, b) {
      return a.name[0].value
          .toLowerCase()
          .compareTo(b.name[0].value.toLowerCase().toLowerCase());
    });

    cDescription.value.text = '';
    isSwitched.value = false;
    categoryEnglishName.value.text = '';
    categoryHindiName.value.text = '';
    imagePath.value = '';

    Navigator.pop(context);
  }

  void searchFun() {
    data.clear();
    for (int i = 0; i < tempData.value.length; i++) {
      if (filterOption == 'Featured') {
        if (tempData.value[i].name[0].value
                .toLowerCase()
                .contains(cSearch.value.text.toLowerCase()) &&
            tempData.value[i].featured == true) {
          data.add(tempData.value[i]);
        }
      } else if (filterOption == 'Non-Featured') {
        if (tempData.value[i].name[0].value
                .toLowerCase()
                .contains(cSearch.value.text.toLowerCase()) &&
            tempData.value[i].featured == false) {
          data.add(tempData.value[i]);
        }
      } else {
        if (tempData.value[i].name[0].value
            .toLowerCase()
            .contains(cSearch.value.text.toLowerCase())) {
          data.add(tempData.value[i]);
        }
      }
    }
  }
}
