// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/models/user.dart';

import 'category.dart';

enum AdStatus {
  pending,
  active,
  sold,
  deleted,
}

class Ad {
  String? id;
  List images;
  String title;
  String description;
  Category category;
  Address address;
  num price;
  bool hidePhone;
  AdStatus status;
  DateTime? created;
  User? user;
  int views;

  Ad({
    this.id,
    required this.images,
    required this.title,
    required this.description,
    required this.category,
    required this.address,
    required this.price,
    required this.hidePhone,
    this.status = AdStatus.pending,
    this.created,
    required this.user,
    this.views = 0,
  });
}
