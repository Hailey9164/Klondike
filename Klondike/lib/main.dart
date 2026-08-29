import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'klondike_game.dart';

// Main entry point for the Klondike game
void main() {
  final game = KlondikeGame();
  runApp(GameWidget(game: game));
}

