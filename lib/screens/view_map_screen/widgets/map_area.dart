import 'package:flutter/material.dart';

class MapArea extends StatelessWidget {
  const MapArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/show_map.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
