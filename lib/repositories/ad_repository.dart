import 'dart:io';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:path/path.dart' as path;
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/uf.dart';
import 'package:xlo_mobx/repositories/category_repository.dart';
import 'package:xlo_mobx/repositories/parse_errors.dart';
import 'package:xlo_mobx/repositories/table_keys.dart';
import 'package:xlo_mobx/repositories/user_repository.dart';

class AdRepository {
  Future<void> save(Ad ad) async {
    try {
      final parseImages = await saveImages(ad.images);

      final parseUser = ParseUser(null, null, null)
        ..set(keyParseID, ad.user!.id);

      final adObject = ParseObject(keyAdTable);

      final parseACL = ParseACL(owner: parseUser);
      parseACL.setPublicReadAccess(allowed: true);
      parseACL.setPublicWriteAccess(allowed: false);
      adObject.setACL(parseACL);

      adObject.set<String>(keyAdTitle, ad.title);
      adObject.set<String>(keyAdDescription, ad.description);
      adObject.set<bool>(keyAdHidePhone, ad.hidePhone);
      adObject.set<num>(keyAdPrice, ad.price);
      adObject.set<int>(keyAdStatus, ad.status.index);
      adObject.set<String>(keyAdDistrict, ad.address.district);
      adObject.set<String>(keyAdCity, ad.address.city.name);
      adObject.set<String>(keyAdFederativeUnit, ad.address.uf.initials!);
      adObject.set<String>(keyAdPostalCode, ad.address.cep);
      if (parseImages != null) {
        adObject.set<List<ParseFile>>(keyAdImages, parseImages);
      }
      adObject.set<ParseUser>(keyAdOwner, parseUser);
      adObject.set<ParseObject>(keyAdCategory,
          ParseObject(keyCategoryTable)..set(keyParseID, ad.category.id));
      final response = await adObject.save();

      /*
      // There is no need to return Ad object now. Just return.
      if (response.success) {
        return adFromParse(response.result);
      } else {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }*/

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      return Future.error('Falha ao salvar o anúncio.');
    }
  }

  Ad adFromParse(ParseObject obj) {
    return Ad(
      id: obj.get(keyParseID),
      title: obj.get<String>(keyAdTitle)!,
      description: obj.get<String>(keyAdDescription)!,
      hidePhone: obj.get<bool>(keyAdHidePhone)!,
      price: obj.get<num>(keyAdPrice)!,
      created: obj.get<DateTime>(keyParseCreatedAt),
      views: obj.get<int>(keyAdViews, defaultValue: 0)!,
      images: obj.get<List>(keyAdImages)!.map((e) => e.url).toList(),
      address: Address(
        uf: UF(initials: obj.get<String>(keyAdFederativeUnit)!),
        city: City(name: obj.get<String>(keyAdCity)!),
        cep: obj.get<String>(keyAdPostalCode)!,
        district: obj.get<String>(keyAdDistrict)!,
      ),
      status: AdStatus.values[obj.get<int>(keyAdStatus)!],
      user: UserRepository().userfromParse(obj.get<ParseUser>(keyAdOwner)!),
      category: CategoryRepository()
          .categoryfromParse(obj.get<ParseObject>(keyAdCategory)!),
    );
  }

  Future<List<ParseFile>?> saveImages(List images) async {
    final parseImages = <ParseFile>[];
    try {
      for (final image in images) {
        dynamic parseFile;
        if (image is File) {
          parseFile = ParseFile(image, name: path.basename(image.path));
          final response = await parseFile.save();
          if (!response.success) {
            return Future.error(
                ParseErrors.getDescription(response.error!.code));
          }
        } else {
          parseFile = ParseFile(null);
          parseFile.name = path.basename(image);
          parseFile.url = image;
        }
        parseImages.add(parseFile);
      }

      return parseImages;
    } catch (e) {
      return Future.error('Falha ao salvar as imagens');
    }
  }
}
