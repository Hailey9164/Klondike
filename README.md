# Klondike Solitaire – Flame Game Project

A custom implementation of **Klondike Solitaire** built using the **Flame game engine** and **Flutter**.  
This project recreates the classic solitaire experience with custom card rendering, sprite‑based assets, draggable interactions, and a structured game world using Flame’s `World` and `CameraComponent`.

---

## Features

### Custom Card Rendering
Each card is drawn manually using Flame’s `Canvas` API, including:
- Front and back designs  
- Rank and suit symbols  
- Pip layouts for cards 1–10  
- Court card illustrations (J, Q, K)  
- Color‑tinted sprites for black suits  

### Full Game Component Architecture
The game world is composed of:
- `Stock`  
- `Waste`  
- `Foundation` ×4  
- `Pile` ×7  
- `Card` components  
- `Suit` and `Rank` singleton classes  

### Flame Engine Integration
Uses Flame’s:
- `PositionComponent`  
- `Sprite`  
- `World`  
- `CameraComponent`  
- `Anchor`  
- `Vector2`  

### Responsive Layout
The camera viewfinder scales the game world to fit any screen size, ensuring consistent card spacing and layout.

---

## Project Structure
```
lib/
klondike_game.dart        # Main game class
components/
stock.dart              # Stock pile
waste.dart              # Waste pile
foundation.dart         # Foundation piles
pile.dart               # Tableau piles
suit.dart               # Suit singleton class
rank.dart               # Rank singleton class
card.dart               # Card rendering + logic
assets/
images/
klondike-sprites.png    # Sprite sheet for suits, ranks, card art
```

---

## Getting Started

### Prerequisites
- Flutter SDK (3.x or later)
- Dart SDK (3.x or later)
- Chrome OR an Android emulator
- Flame package (`^1.38.0`)

### Install Dependencies
```flutter pub get```


### Run the Game (Chrome recommended)
```flutter run -d chrome```

Or from VS Code:
- Select **Chrome** in the device dropdown  
- Press **F5**

---

## How the Game Works

### World & Camera
The game uses Flame’s default `World` and `CameraComponent`.  
The camera is configured to show the entire game layout regardless of screen size.

### Card Rendering
Cards are drawn manually using:
- `Canvas.drawRRect`
- `Sprite.render`
- Custom helper `_drawSprite()`
- Conditional rendering based on `isFaceUp`

### Suit & Rank
Both use singleton patterns:
- `Suit.fromInt(int)`  
- `Rank.fromInt(int)`  

This ensures consistent references and avoids duplicate objects.

### Temporary Debug Cards
During development, random cards are placed on the board to verify rendering:

```dart
final random = Random();
for (var i = 0; i < 7; i++) {
  for (var j = 0; j < 4; j++) {
    final card = Card(random.nextInt(13) + 1, random.nextInt(4))
      ..position = Vector2(100 + i * 1150, 100 + j * 1500)
      ..addToParent(world);
    if (random.nextDouble() < 0.9) {
      card.flip();
    }
  }
}
```
## Technologies Used
- Flutter – UI framework
- Flame – Game engine
- Dart – Programming language
- SpriteCow – Used to extract sprite coordinates
- Canvas API – Custom rendering

## Author
Hailey  
Senior Computer Science major at Cal Poly Pomona
