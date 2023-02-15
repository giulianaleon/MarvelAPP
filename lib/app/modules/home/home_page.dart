import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/character_store.dart';
import '../request/api.dart';
import '../models/character_model.dart';
import '../home/character_details.dart';


class CharactersPage extends StatefulWidget {
  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final CharacterStore _store = CharacterStore();
  ModalCharacterDetails modal = ModalCharacterDetails();

  @override
  void initState() {
    super.initState();
    _store.getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'MARVEL',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (_store.characters.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: _store.characters.length,
            itemBuilder: (BuildContext context, int index) {
              final Character character = _store.characters[index];
              return SingleChildScrollView(
                child: Container(
                  color: const Color.fromRGBO(2, 2, 2, 230),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          modal.mainBottomSheet(context, character);
                        },
                        child: Stack(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(17.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100.0,
                                      height: 150.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(character.thumbnailUrl),
                                        ),
                                      ),

                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              character.name,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              character.description,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff8A8A8A)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              bottom: 15,
                              right: 15,
                              child: Row(
                                children: [
                                  Text(
                                    "More info",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}