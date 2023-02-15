import 'package:flutter/material.dart';
import '../models/character_model.dart';

class ModalCharacterDetails {
  mainBottomSheet(BuildContext context, Character result) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return _body(context, result);
        });
  }

  Widget _body(BuildContext context, Character article) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _headerCharacter(context, article),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    article.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF05A8F3),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        article.name,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const Divider(
                    height: 20,
                    thickness: 1,
                  ),
                  Text(
                    article.description,
                    style: const TextStyle(fontSize: 13, color: Colors.black),
                    textAlign: TextAlign.justify,
                  ),
                  const Divider(
                    height: 20,
                    thickness: 1,
                  ),
                  const Text(
                    "Comics",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    article.comics[0],
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  const Text(
                    "Series",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    article.series[0],
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerCharacter(BuildContext context, Character character) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(character.thumbnailUrl))),
        ),
      ],
    );
  }
}