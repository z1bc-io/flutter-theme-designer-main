import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomFontWeight extends StatefulWidget {
  final bool isSelected;
  final Function() callback;
  const CustomFontWeight(
      {super.key, required this.isSelected, required this.callback});

  @override
  State<CustomFontWeight> createState() =>
      _FontWeightState(isSelected: isSelected, callback: callback);
}

class _FontWeightState extends State<CustomFontWeight> {
  bool isSelected;
  Function() callback;

  _FontWeightState({required this.isSelected, required this.callback});

  void updateSelection() {
    setState(() => {
          isSelected = !isSelected,
        });
    callback();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: updateSelection,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? Colors.grey[600] : Colors.grey[300]),
        width: 30,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("B", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
