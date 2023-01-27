import 'package:dio/dio.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/repositories/ibge_repository.dart';

import '../models/city.dart';
import '../models/uf.dart';

class CepRepository {
  Future getAddressFromApi(String cep, {doCitySearch = false}) async {
    if (cep.isEmpty) {
      return Future.error('CEP inválido.');
    }
    final cepOnlyNumbers = cep.replaceAll(RegExp(r'\D'), '');

    if (cepOnlyNumbers.length != 8) {
      return Future.error('CEP inválido.');
    }

    final endpoint = 'https://viacep.com.br/ws/$cepOnlyNumbers/json';

    try {
      final response = await Dio().get<Map>(endpoint);

      if (response.data != null &&
          !(response.data!.containsKey('erro') &&
              response.data!['erro'] == true)) {
        final ufList = await IbgeRepository().getUFList();

        // * this creates a reference to the original response. I don't want this
        //final responseMap = response.data as Map<String, dynamic>;
        // to clone a map use Map.from()
        final Map<String, dynamic> responseMap =
            Map.from(response.data as Map<String, dynamic>);
        // replace a simple string with a UF object in the key "uf" obtained from ViaCEP
        responseMap['uf'] =
            ufList.firstWhere((uf) => uf.initials == response.data!['uf']);

        if (doCitySearch) {
          // if we want to pass a full City object use bellow code
          final cityList = await IbgeRepository()
              .getCityListFromApi(UF(initials: response.data!['uf']));
          responseMap['city'] = cityList.firstWhere((City city) {
            return city.name.toLowerCase() ==
                response.data!['localidade'].toString().toLowerCase();
          });
        }

        return Address.fromMap(responseMap);
      } else {
        return Future.error('CEP inválido.');
      }
    } on DioError {
      return Future.error('Falha ao obter o CEP.');
    }
  }
}
