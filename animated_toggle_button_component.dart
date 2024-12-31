import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  final ValueChanged<String> onTap;

  const CustomToggleButton({
    super.key,
    required this.onTap,
  });
  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        children: [
          // English Option
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 0;
              });
              widget.onTap(_selectedIndex.toString());
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.linearToEaseOut,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: _selectedIndex == 0 ? Colors.white : Colors.blue,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(50),
                  right: Radius.circular(50),
                ),
              ),
              child: Row(
                spacing: 5,
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: _selectedIndex == 0 ? Colors.blue : Colors.white,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      color: _selectedIndex == 0 ? Colors.blue : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bangla Option
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 1;
              });
              widget.onTap(_selectedIndex.toString());
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.linearToEaseOut,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: _selectedIndex == 1 ? Colors.white : Colors.blue,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(50),
                  right: Radius.circular(50),
                ),
              ),
              child: Row(
                spacing: 5,
                children: [
                  Icon(
                    Icons.apartment_rounded,
                    color: _selectedIndex == 1 ? Colors.blue : Colors.white,
                  ),
                  Text(
                    "Office",
                    style: TextStyle(
                      color: _selectedIndex == 1 ? Colors.blue : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
