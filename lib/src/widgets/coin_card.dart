import 'package:flutter/material.dart';

import '../constants/string_data.dart';

class CoinCard extends StatelessWidget {
  VoidCallback onTap;
  String? image;
  String name;
  String symbol;
  num price;
  num priceChange;

  CoinCard(
      {required this.image,
      required this.onTap,
      required this.name,
      required this.symbol,
      required this.price,
      required this.priceChange});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          leading: Image.network(
            image ?? StringData.constImage,
            errorBuilder: (context, error, strackTrace) => Icon(Icons.error),
          ),
          title: Text(
            name,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(
              '${double.parse(price.toString()).toStringAsFixed(3)}  ${symbol.toUpperCase()}'),
          trailing: Text(
            double.parse(priceChange.toString()).toStringAsFixed(3),
            style: TextStyle(
                color: priceChange.toString().contains('-')
                    ? Colors.red
                    : Colors.green),
          ),
        ),
      ),
    );
  }
}
