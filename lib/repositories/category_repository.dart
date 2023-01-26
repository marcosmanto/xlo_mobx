import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/repositories/parse_errors.dart';
import 'package:xlo_mobx/repositories/table_keys.dart';

import '../models/category.dart';

class CategoryRepository {
  Future getList() async {
    final queryBuilder = QueryBuilder(ParseObject(keyCategoryTable))
      ..orderByAscending(keyCategoryDescription);

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return response.results!
          .map((category) => categoryfromParse(category))
          .toList();
    }

    throw ParseErrors.getDescription(response.error!.code);
  }

  Category categoryfromParse(ParseObject category) {
    return Category(
      id: category.objectId,
      description: category.get(keyCategoryDescription),
      createdAt: category.createdAt,
    );
  }
}
