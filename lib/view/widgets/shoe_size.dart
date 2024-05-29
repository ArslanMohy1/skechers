import 'package:flutter/material.dart';
import 'package:skechers/view/utils/constant.dart';

class ShoeSizeSelector extends StatefulWidget {
  final Function(String) onSelectSize;
  final List<String> availableSizes;

  const ShoeSizeSelector({
    Key? key,
    required this.onSelectSize,
    required this.availableSizes,
  }) : super(key: key);

  @override
  _ShoeSizeSelectorState createState() => _ShoeSizeSelectorState();
}

class _ShoeSizeSelectorState extends State<ShoeSizeSelector> {
  String? _selectedSize;

  List<String> _shoeSizes = [
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 10.0, // Spacing between buttons
        runSpacing: 10.0, // Spacing between rows
        children: _shoeSizes.map((size) {
          bool isAvailable = widget.availableSizes.contains(size);
          return GestureDetector(
            onTap: isAvailable
                ? () {
              setState(() {
                _selectedSize = size;
              });
              widget.onSelectSize(size);
            }
                : null,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: _selectedSize == size ? Color(kcolor) : Colors.transparent,
                    border: Border.all(color: isAvailable ? Color(kcolor) : Colors.red),
                  ),
                  child: Text(
                    size,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: _selectedSize == size ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                if (!isAvailable)
                  Positioned.fill(
                    child: Container(
                      color: Colors.red.withOpacity(0.3),
                      child: Center(
                        child: Icon(
                          Icons.clear,
                          color: Colors.red,
                          size: 32.0,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}  
