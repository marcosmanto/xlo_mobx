import 'package:dio/dio.dart';
import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/uf.dart';

class IbgeRepository {
  Future<List<UF>> getUFListFromApi() async {
    const endpoint =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados';

    try {
      final response = await Dio().get<List>(endpoint);
      if (response.data != null) {
        final ufList = response.data!
            .map<UF>((ufMap) => UF.fromMap(ufMap))
            .toList()
          ..sort(
              (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        return ufList;
      } else {
        return Future.error('Nenhuma UF retornada.');
      }
    } on DioError {
      return Future.error('Falha ao obter a lista de UFs.');
    }
  }

  getCityListFromApi(UF uf) async {
    final endpoint =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.id}/municipios';

    try {
      final response = await Dio().get<List>(endpoint);
      if (response.data != null) {
        final cityList = response.data!
            .map<City>((cityMap) => City.fromMap(cityMap))
            .toList()
          ..sort(
              (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        print(cityList);
        return cityList;
      } else {
        return Future.error('Nenhuma cidade retornada.');
      }
    } on DioError {
      return Future.error('Falha ao obter a lista de cidades.');
    }
  }
}
