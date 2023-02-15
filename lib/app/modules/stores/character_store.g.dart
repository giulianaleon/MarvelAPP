// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterStore on _CharacterStore, Store {
  late final _$charactersAtom =
      Atom(name: '_CharacterStore.characters', context: context);

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$selectedCharacterAtom =
      Atom(name: '_CharacterStore.selectedCharacter', context: context);

  @override
  Character get selectedCharacter {
    _$selectedCharacterAtom.reportRead();
    return super.selectedCharacter;
  }

  @override
  set selectedCharacter(Character value) {
    _$selectedCharacterAtom.reportWrite(value, super.selectedCharacter, () {
      super.selectedCharacter = value;
    });
  }

  late final _$getCharactersAsyncAction =
      AsyncAction('_CharacterStore.getCharacters', context: context);

  @override
  Future<void> getCharacters() {
    return _$getCharactersAsyncAction.run(() => super.getCharacters());
  }

  late final _$getCharacterByIdAsyncAction =
      AsyncAction('_CharacterStore.getCharacterById', context: context);

  @override
  Future<void> getCharacterById(int id) {
    return _$getCharacterByIdAsyncAction.run(() => super.getCharacterById(id));
  }

  @override
  String toString() {
    return '''
characters: ${characters},
selectedCharacter: ${selectedCharacter}
    ''';
  }
}
