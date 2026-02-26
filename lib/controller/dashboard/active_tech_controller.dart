import 'package:get/get.dart';

class TechModel {
  int id;
  String name;
  String imagePath;
  bool isOnline;
  RxBool isActive;

  TechModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.isOnline,
    bool isActive = false,
  }) : isActive = isActive.obs;
}

class ActiveTechController extends GetxController {
  var techs = <TechModel>[
    TechModel(id: 1, name: "Rachel", imagePath: "assets/images/user1.png", isOnline: false, isActive: false),
    TechModel(id: 2, name: "Steve", imagePath: "assets/images/user2.png", isOnline: true, isActive: false),
    TechModel(id: 3, name: "Adam", imagePath: "assets/images/user3.png", isOnline: false, isActive: false),
    TechModel(id: 4, name: "Harrison", imagePath: "assets/images/user4.png", isOnline: true, isActive: false),
    TechModel(id: 5, name: "Job", imagePath: "assets/images/user5.png", isOnline: true, isActive: false),
    TechModel(id: 6, name: "Jacob", imagePath: "assets/images/user6.png", isOnline: true, isActive: false),
  ].obs;

  void toggleActivate(int index) {
    techs[index].isActive.value = !techs[index].isActive.value;
  }
}
