import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({Key? key, required this.items, this.selected, required this.hint, required this.onChange})
      : super(key: key);

  final List<String> items;
  final String? selected;
  final String hint;
  final Function onChange;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? selected;

  @override
  void initState() {
    selected = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(width: 1.0, color: const Color(0xffb5b5b5)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 0,
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.list,
                size: 24,
                color: Color(0xff707070),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  widget.hint,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xff707070),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: widget.items
              .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xff707070),
              ),
            ),
          ))
              .toList(),
          value: selected,
          onChanged: (value) {
            setState(() {
              selected = value as String;
            });
            widget.onChange(value);
          },
        ),
      ),
    );
  }
}
