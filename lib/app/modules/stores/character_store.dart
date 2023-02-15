import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../models/character_model.dart';
import '../request/api.dart';

part 'character_store.g.dart';

class CharacterStore = _CharacterStore with _$CharacterStore;

abstract class _CharacterStore with Store {
  final MarvelApi marvelApi = MarvelApi();

  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @observable
  late Character selectedCharacter;

  @action
  Future<void> getCharacters() async {
    final Map<String, dynamic> data = await marvelApi.getCharacters();
    final List<dynamic> results = data['data']['results'];

    characters.clear();
    characters.addAll(results.map((json) => Character.fromJson(json)));
  }

  @action
  Future<void> getCharacterById(int id) async {
    final Map<String, dynamic> data = await marvelApi.getCharacterById(id);
    final dynamic result = data['data']['results'][0];

    selectedCharacter = Character.fromJson(result);
  }
}
