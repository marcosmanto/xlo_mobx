import 'package:xlo_mobx/models/ad.dart';

class AdRepository {
  Future<void> save(Ad ad) async {
    await Future.delayed(Duration(seconds: 5));
  }
}
