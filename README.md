# Flutter BorderSide.strokeAlign Demo

![Demo Output]<img src="border-output.gif" width="50%">

A visual demonstration of Flutter's `BorderSide.strokeAlign` property showing various border shapes with animated stroke alignment.

## Features

- Demonstrates 6 different border shapes:
  - StadiumBorder
  - CircleBorder
  - OvalBorder
  - BeveledRectangleBorder (standard and rounded)
  - RoundedRectangleBorder (standard and rounded)
  - StarBorder (standard, 8-point, and 6-side polygon)
- Animated stroke alignment transition (inside ↔ center ↔ outside)
- Clean, responsive layout with labeled examples

## How It Works

The app uses:

- `AnimationController` to animate the `strokeAlign` value between -1 (inside) and 1 (outside)
- Various `ShapeBorder` implementations to demonstrate different border styles
- Custom `BorderedBox` widget for consistent sizing and margins

## Code Structure

```plaintext
lib/
├── main.dart            # Main application entry point
│   ├── StrokeAlignApp   # Root widget
│   ├── StrokeAlignExample # Demo page stateful widget
│   └── BorderedBox      # Reusable bordered container
```
