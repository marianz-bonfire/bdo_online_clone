import 'package:bdo_online_clone/core/common/app_color.dart';
import 'package:flutter/material.dart';

class SelectionItemToggle extends StatefulWidget {
  final IconData? icon;
  final IconData? iconRight;
  final Color? iconRightColor;
  final String text;
  final String description;
  final Function(bool) onToggle;
  const SelectionItemToggle({
    super.key,
    this.icon,
    this.iconRight,
    this.iconRightColor,
    required this.text,
    required this.description,
    required this.onToggle,
  });

  @override
  State<SelectionItemToggle> createState() => _SelectionItemToggleState();
}

class _SelectionItemToggleState extends State<SelectionItemToggle> {

  bool _switchValue = true;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        children: [
          if (widget.icon != null) ...[
            Icon(widget.icon, size: 28, color: AppColor.primaryColor),
            const SizedBox(width: 16),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.description,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Switch(
            value: _switchValue,
            onChanged: (value) {
              setState(() {
                _switchValue = value;
                widget.onToggle(value);
              });
            },
          ),
        ],
      ),
    );
  }
}
