import 'package:flutter/material.dart';
import 'dart:collection';

import 'package:truckrrone/subscriptionpage/model/vehicleitem.dart';

class Multiselectsearchdropdown {
  final List<VehicleItem> itemList;
  List<VehicleItem> filteredItemList;
  final Set<VehicleItem> selectedItems;

  Multiselectsearchdropdown({
    required this.itemList,
    required Set<VehicleItem> currentSelections,
  })  : filteredItemList = List.from(itemList),
        selectedItems = SplayTreeSet.from(currentSelections);

  /// Filters the list based on the provided query, searching in vehicleNumber only.
  void filterItems(String query) {
    if (query.isEmpty) {
      filteredItemList = List.from(itemList);
    } else {
      final lowerQuery = query.toLowerCase();
      filteredItemList = itemList.where((item) {
        final lowerNumber = item.vehicleNumber.toLowerCase();
        return lowerNumber.contains(lowerQuery);
      }).toList();

      // Sort results: prioritize those that start with the vehicle number
      filteredItemList.sort((a, b) {
        final aStarts = a.vehicleNumber.toLowerCase().startsWith(lowerQuery);
        final bStarts = b.vehicleNumber.toLowerCase().startsWith(lowerQuery);
        if (aStarts && !bStarts) return -1;
        if (!aStarts && bStarts) return 1;
        return a.vehicleNumber.compareTo(b.vehicleNumber);
      });
    }
  }

  void toggleSelection(VehicleItem item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
  }

  Widget buildVehicleItemDisplay(VehicleItem item, String searchQuery) {
    final fullText = item.displayString;

    if (searchQuery.isEmpty) {
      return Text(
        fullText,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 12),
      );
    }

    final lowerText = fullText.toLowerCase();
    final lowerQuery = searchQuery.toLowerCase();

    final spans = <TextSpan>[];
    var startIndex = 0;

    while (startIndex < fullText.length) {
      final index = lowerText.indexOf(lowerQuery, startIndex);
      if (index == -1) {
        spans.add(TextSpan(text: fullText.substring(startIndex)));
        break;
      }
      if (index > startIndex) {
        spans.add(TextSpan(text: fullText.substring(startIndex, index)));
      }
      spans.add(TextSpan(
        text: fullText.substring(index, index + searchQuery.length),
        style: TextStyle(
          backgroundColor: Colors.yellow[200],
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ));
      startIndex = index + searchQuery.length;
    }

    return RichText(
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: const TextStyle(fontSize: 12, color: Colors.black),
        children: spans,
      ),
    );
  }

  Future<Set<VehicleItem>?> showMultiSelectionDialog({
    required BuildContext context,
    required TextEditingController searchController,
    required String title,
  }) async {
    searchController.clear();
    filterItems('');

    Set<VehicleItem>? finalSelections;

    await showDialog<Set<VehicleItem>>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(title, style: const TextStyle(fontSize: 18)),
              content: SizedBox(
                width: double.maxFinite,
                height: 400,
                child: Column(
                  children: [
                    TextFormField(
                      controller: searchController,
                      onChanged: (value) {
                        filterItems(value);
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        hintText: 'Search...',
                        prefixIcon: const Icon(Icons.search, size: 20),
                        suffixIcon: searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear, size: 18),
                                onPressed: () {
                                  searchController.clear();
                                  filterItems('');
                                  setState(() {});
                                },
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '${selectedItems.length} selected (${filteredItemList.length} shown)',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredItemList.length,
                        itemBuilder: (context, index) {
                          final item = filteredItemList[index];
                          final isSelected = selectedItems.contains(item);

                          return CheckboxListTile(
                            dense: true,
                            // Move checkbox to the right side
                            controlAffinity: ListTileControlAffinity.trailing,
                            value: isSelected,
                            title: buildVehicleItemDisplay(
                                item, searchController.text),
                            selected: isSelected,
                            onChanged: (bool? newValue) {
                              setState(() {
                                toggleSelection(item);
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    finalSelections = selectedItems;
                    Navigator.of(context).pop();
                  },
                  child: const Text('Done'),
                ),
              ],
            );
          },
        );
      },
    );

    return finalSelections;
  }
}