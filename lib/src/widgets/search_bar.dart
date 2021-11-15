import '../constants/routes.dart';
import 'package:flutter/material.dart';

import '../constants/string_data.dart';
import '../models/coins.dart';
import '../screens/detail_screen/detail_screen.dart';

class SearchBar extends StatefulWidget {
  List<Coins> coinslist;
  SearchBar(this.coinslist);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _displayStringForOption(Coins option) => option.name;

  @override
  Widget build(BuildContext context) {
    double iconSearchAndTextFielsSearchPadding = 10;
    double widthOfBoxSeletionSearchBar = 300;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 20),
          Icon(
            Icons.search,
            size: 30,
            color: Colors.blueAccent,
          ),
          SizedBox(width: iconSearchAndTextFielsSearchPadding),
          Flexible(
            child: Autocomplete<Coins>(
              displayStringForOption: _displayStringForOption,
              fieldViewBuilder: (BuildContext context,
                  TextEditingController fieldTextEditingController,
                  FocusNode fieldFocusNode,
                  VoidCallback onFieldSubmitted) {
                return TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: StringData.hintTextSearch),
                  controller: fieldTextEditingController,
                  focusNode: fieldFocusNode,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                );
              },
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<Coins>.empty();
                }
                return widget.coinslist.where((Coins option) {
                  return option.name
                          .toString()
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()) ||
                      option.symbol
                          .toString()
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase());
                });
              },
              optionsViewBuilder: (context, onSelected, options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    color: Colors.white,
                    width: widthOfBoxSeletionSearchBar,
                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Coins option = options.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            onSelected(option);
                          },
                          child: Card(
                            child: ListTile(
                              leading: Image.network(
                                option.image,
                                errorBuilder: (context, error, strackTrace) =>
                                    Icon(Icons.error),
                              ),
                              title: Text(
                                option.name,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
              onSelected: (Coins coin) {
                Navigator.pushNamed(context, RouteConstant.detailRoute,
                    arguments: coin);
              },
            ),
          ),
        ],
      ),
    );
  }
}
