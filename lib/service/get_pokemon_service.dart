import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokemonapp/model/model_pokemon.dart';

class GetPokemonService {
  static PokemonModel? resData;
  static Future<PokemonModel> getPokemon() async {
    try {
      Response response = await Dio().get(
          "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
      if (response.statusCode == 200) {
        resData = PokemonModel.fromJson(jsonDecode(response.data));
        return PokemonModel.fromJson(jsonDecode(response.data));
      } else {
        return PokemonModel.fromJson(response.data);
      }
    } catch (e) {
      return PokemonModel.fromJson({});
    }
  }
}
