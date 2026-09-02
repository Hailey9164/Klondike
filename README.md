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
- Manual rendering using Flame's `Canvas` API

### Full Game Component Architecture
The game world is composed of:
- `Stock`  
- `Waste`  
- `Foundation` ×4  
- `Pile` ×7  
- `Card` components  
- `Suit` and `Rank` singleton classes
- Custom `KlondikeWorld` for game lifecycle management  

### Flame Engine Integration
Uses Flame’s:
- `PositionComponent`  
- `Sprite`  
- `World`  
- `CameraComponent`  
- `Anchor`  
- `Vector2`

### Gameplay Mechanics
- Drag‑and‑drop movement  
- Multi‑card dragging for tableau runs  
- Auto‑move to foundation on tap  
- Draw‑1 and Draw‑3 modes  
- “Same Deal” mode using RNG seeding  
- Win detection + celebration animation  

### Smooth Animations
Powered by Flame’s Effects system:
- Animated card movement (`MoveToEffect`)  
- Animated card flipping (`ScaleEffect`)  
- Animated dealing sequence  
- Animated tableau settling  

### Restart & Mode Buttons
- **New Deal**  
- **Same Deal**  
- **Draw 1 ⇌ 3**  
- **Have Fun** (bonus animation mode)

### Responsive Layout
The camera viewfinder scales the game world to fit any screen size, ensuring consistent card spacing and layout.

---

## Project Structure
```
lib/
klondike_game.dart        # FlameGame class (global settings, draw mode, seed)
klondike_world.dart       # Custom World: setup, deal, restart, win logic

components/
card.dart               # Card rendering, flipping, dragging, animations
stock_pile.dart         # Stock pile logic + draw behavior
waste_pile.dart         # Waste pile logic + fan-out
foundation_pile.dart    # Foundation logic + acceptance rules
tableau_pile.dart       # Tableau logic + layout + multi-card moves
flat_button.dart        # Custom button component for restart/actions

rank.dart                 # Rank singleton class
suit.dart                 # Suit singleton class

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
```bash
flutter pub get
```


### Run the Game (Chrome recommended)
```bash
flutter run -d chrome
```

Or from VS Code:
- Select **Chrome** in the device dropdown  
- Press **F5**

---

## How the Game Works

### World & Camera
'KlondikeWorld' handles:

- Creating piles
- Creating cards
- Shuffling & dealing
- Animations
- Restart logic
- Win detection

The camera is configured to display the entire play area regardless of screen size.

### Card Rendering & Animation
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

### Game Restart System
- New Deal
- Same Deal (seeded RNG)
- Draw‑1 / Draw‑3 toggle
- Fun mode animation

All restart logic is handled inside 'KlondikeWorld'.

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
- Flame Effects – Animation system

## Author
Hailey  
Senior Computer Science major at Cal Poly Pomona
