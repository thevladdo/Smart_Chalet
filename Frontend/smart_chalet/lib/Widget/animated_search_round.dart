import 'package:flutter/material.dart';

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({Key? key}) : super(key: key);

  @override
  State<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 16),
              child: !_folded
                  ? const TextField(
                      decoration: InputDecoration(
                      hintText: 'SEARCH',
                      hintStyle: TextStyle(fontSize: 15),
                      border: InputBorder.none,
                    ))
                  : null,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(microseconds: 500),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_folded ? 32 : 0),
                  bottomLeft: Radius.circular(_folded ? 32 : 0),
                  topRight: const Radius.circular(32),
                  bottomRight: const Radius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    _folded ? Icons.search_rounded : Icons.close_rounded,
                    color: const Color.fromARGB(255, 32, 32, 32),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _folded = !_folded;
                  });
                },
              ),
            ),
          )
        ],
      ),
      duration: const Duration(microseconds: 500),
      width: _folded ? 56 : 200,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        boxShadow: kElevationToShadow[6],
      ),
    );
  }
}
