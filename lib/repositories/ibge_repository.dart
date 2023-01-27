import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/uf.dart';

class IbgeRepository {
  Future<List<UF>> getUFList() async {
    final preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey('UF_LIST')) {
      final jsonDecoded = jsonDecode(preferences.getString('UF_LIST')!);
      return jsonDecoded.map<UF>((ufMap) => UF.fromMap(ufMap)).toList()
        ..sort((UF a, UF b) {
          if (a.name != null && b.name != null) {
            return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
          }
          return 0;
        });
    }

    const endpoint =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados';

    try {
      final response = await Dio().get<List>(endpoint);

      if (response.data != null) {
        preferences.setString('UF_LIST', jsonEncode(response.data));
        final ufList =
            response.data!.map<UF>((ufMap) => UF.fromMap(ufMap)).toList()
              ..sort((UF a, UF b) {
                if (a.name != null && b.name != null) {
                  return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
                }
                return 0;
              });

        return ufList;
      } else {
        return Future.error('Nenhuma UF retornada.');
      }
    } on DioError {
      return Future.error('Falha ao obter a lista de UFs.');
    }
  }

  Future<List<City>> getCityListFromApi(UF uf) async {
    final dynamic idOrInitial = uf.id ?? uf.initials;
    final endpoint =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$idOrInitial/municipios';

    try {
      final response = await Dio().get<List>(endpoint);
      if (response.data != null) {
        final cityList = response.data!
            .map<City>((cityMap) => City.fromMap(cityMap))
            .toList()
          ..sort(
              (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        //print(cityList);
        return cityList;
      } else {
        return Future.error('Nenhuma cidade retornada.');
      }
    } on DioError {
      return Future.error('Falha ao obter a lista de cidades.');
    }
  }
}
