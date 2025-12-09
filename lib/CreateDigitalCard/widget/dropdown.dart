// dropdown.dart
import 'package:flutter/material.dart';

import 'package:proper_multiselect_search_dropdown/different_type_dropdown/proper_singleselect_search_dropdown.dart';

class CustomSingleSelectDropdown extends StatefulWidget {
  final String hintText;
  final List<List<String>> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final bool enableSearch;

  const CustomSingleSelectDropdown({
    super.key,
    required this.hintText,
    required this.items,
    this.selectedValue,
    required this.onChanged,
    this.enableSearch = true,
  });

  @override
  State<CustomSingleSelectDropdown> createState() =>
      _CustomSingleSelectDropdownState();
}

class _CustomSingleSelectDropdownState
    extends State<CustomSingleSelectDropdown> {
  List<String>? _currentSelected; // [value, displayText]

  @override
  void initState() {
    super.initState();
    if (widget.selectedValue != null) {
      final found = widget.items.firstWhere(
            (item) => item[0] == widget.selectedValue,
        orElse: () => [widget.selectedValue!, widget.selectedValue!],
      );
      _currentSelected = found;
    }
  }

  @override
  void didUpdateWidget(covariant CustomSingleSelectDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedValue != widget.selectedValue) {
      if (widget.selectedValue == null) {
        _currentSelected = null;
      } else {
        final found = widget.items.firstWhere(
              (item) => item[0] == widget.selectedValue,
          orElse: () => [widget.selectedValue!, widget.selectedValue!],
        );
        _currentSelected = found;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ProperSingleSelectDropdown(
        items: widget.items,
        hintText: widget.hintText,
        enableSearch: widget.enableSearch,
        hintTextStyle: TextStyle(color: Colors.grey[600],fontFamily: 'Poppins'),
        titleTextStyle: TextStyle(fontFamily: 'Poppins'),
        onSelectionChanged: (selected) {
          setState(() {
            _currentSelected = selected;
          });
          widget.onChanged(selected?[0]); // pass only the value
        },
      ),
    );
  }
}

class CustomAppDropdown<T> extends StatelessWidget {
  final String hint;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final bool isRequired;
  final double height;
  final EdgeInsetsGeometry padding;
  const CustomAppDropdown({
    Key? key,
    required this.hint,
    this.value,
    required this.items,
    required this.onChanged,
    this.isRequired = false,
    this.height = 40,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border.all(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          icon: const Icon(Icons.keyboard_arrow_down),
          isDense: true,
          style: TextStyle(fontSize: 14,fontFamily: 'Poppins', color: Colors.black87),
          decoration: InputDecoration(
            isCollapsed: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 8,
            ),
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey[400],fontFamily: 'Poppins'),
            hintText: isRequired ? '$hint *' : hint,
          ),
        ),
      ),
    );
  }
}