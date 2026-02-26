import 'package:get/get.dart';
import 'package:ighty_support/generated/assets.dart';

class CustomerModel {
  int id;
  String name;
  String location;
  String service;
  String imagePath;

  CustomerModel({
    required this.id,
    required this.name,
    required this.location,
    required this.service,
    required this.imagePath,
  });
}

class AllCustomersController extends GetxController {
  var customers = <CustomerModel>[
    CustomerModel(id: 1, name: "Ruban Smith", location: "Dallas Hospital", service: "IT Support", imagePath: Assets.iconProfileIcon),
    CustomerModel(id: 2, name: "Eve Mari", location: "Meuseum", service: "CCTV installation", imagePath: Assets.iconProfileIcon),
    CustomerModel(id: 3, name: "David", location: "Super Market", service: "Network installation", imagePath: Assets.iconProfileIcon),
    CustomerModel(id: 4, name: "Angel Mariel", location: "Airport Dallas", service: "CCTV installation", imagePath: Assets.iconProfileIcon),
    CustomerModel(id: 5, name: "Aden", location: "Dallas Hospital", service: "IT Support", imagePath: Assets.iconProfileIcon),
    CustomerModel(id: 6, name: "Dom", location: "Meuseum", service: "CCTV installation", imagePath: Assets.iconProfileIcon),
    CustomerModel(id: 7, name: "Christopher", location: "Super Market", service: "Network installation", imagePath: Assets.iconProfileIcon),
  ].obs;
}
